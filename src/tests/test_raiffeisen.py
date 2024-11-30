import datetime
from decimal import Decimal
from unittest import mock

from ofxstatement_ru.raiffeisen import RaiffeisenPlugin
from .util import file_sample


def test_parser():
    plugin = RaiffeisenPlugin(
        mock.Mock(), {"account": "462235******0069", "currency": "EUR"}
    )
    statement = plugin.get_parser(file_sample("raiffeisen.csv")).parse()
    assert statement.bank_id == "Raiffeisen"
    assert statement.currency == "EUR"
    assert statement.account_id == "462235******0069"
    assert len(statement.lines) == 25
    _check_line(
        statement.lines[0],
        "-123.45",
        datetime.datetime(2024, 9, 27, 0, 0),
        "Описание 1",
        None,
    )
    _check_line(
        statement.lines[1],
        "678.90",
        datetime.datetime(2024, 9, 25, 0, 0),
        "Описание 2",
        None,
    )
    _check_line(
        statement.lines[2],
        "-12.34",
        datetime.datetime(2024, 9, 25, 0, 0),
        "Описание 3",
        None,
    )


def _check_line(line, amount, date, memo, payee):
    assert line.amount == Decimal(amount)
    assert line.date == date
    assert line.memo == memo
    assert line.payee == payee
