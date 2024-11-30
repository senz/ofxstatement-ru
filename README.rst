~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Russian banks plugins for ofxstatement
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

`ofxstatement`_ is a tool to convert proprietary bank statement to OFX format,
suitable for importing to GnuCash. Plugin for ofxstatement parses a
particular proprietary bank statement format and produces common data
structure, that is then formatted into an OFX file.

`ofxstatement-ru`_ provides some Russian banks plugins for ofxstatement.


.. _ofxstatement: https://github.com/kedder/ofxstatement
.. _ofxstatement-ru: https://github.com/senz/ofxstatement-ru

Supported banks:

* Avangard Bank (http://avangard.ru) plugin 'avangard'
* Tinkoff Bank (http://tinkoff.ru) plugin 'tinkoff'
* SberBank (http://sbrf.ru) plugins 'sberbank_csv', 'sberbank_txt'
* AlfaBank (https://www.alfabank.ru) plugin 'alfabank'
* VTB (https://www.vtb.ru) plugin 'vtb'
* Raiffeisen (https://www.raiffeisen.ru) plugin 'raiffeisen'


Avangard
--------

CSV statements for credit, debit or current account.

Tinkoff
-------

CSV statement for credit, debit and saving account.

SberBankCSV
-----------

CSV statement (available via "request statement by e-mail as Excel sheet" function).

SberBankTxt
-----------

Legacy TXT statement (available via "request statement by e-mail" function) for debit card.

AlfaBank
--------

CSV statement for current account.

VTB
---

CSV statement for debit card.

Raiffeisen
----------

CSV statemenr for account.
Basic support for DEBIT and CREDIT transactions.

Plugin configuration parameters
===============================

avangard
--------

bank
        Bank id
        (default is 'Avangard')

account
        Account id

currency
        Currency
        (default is 'RUB')

tinkoff
-------

bank
        Bank id
        (default is 'Tinkoff')

account
        Account id

currency
        Currency
        (if not set, will be extracted from the first record)

sberbank_txt
------------

bank
        Bank id
        (default is 'SberBank')

account
        Account id
        (if not set, will be extracted from the statement)

currency
        Currency
        (if not set, will be extracted from the statement)

alfabank
--------

bank
        Bank id
        (default is 'Alfabank')

account
        Account id
        (if not set, will be extracted from the statement)

currency
        Currency
        (if not set, will be extracted from the statement)

user_date
        if 'true' then transaction date will be set to the date when transaction is created (so called user date)
        rather then record date. User date is extracted in description if it is present there

file_encoding
        cp1251 by default. No need to change in regular usage (download statement, then convert),
        but could be handy in case of some file processing that involves encoding change

vtb
---

bank
        Bank id
        (default is 'VTB')

user_date
        if 'true' then transaction date will be set to the date when transaction is created (so called user date)
        rather then record date.

raiffeisen
----------

bank
        Bank id
        (default is 'Raiffeisen')

account
        Account id

currency
        Currency
        

Development
===========

Project is targeting python 3 (3.9 for sure as current widespread version) and
pytest is used for testing.

Recommended way to setup is with DevContainer in VSCode.

Manual development setup is as follows:

1. Create virtual environment and activate it
.. code-block:: bash

    make install
    poetry shell

2. Run tests using pytest
.. code-block:: bash

    make test



Authors
=======
|  Copyright (c) 2013 Andrey Lebedev <andrey@lebedev.lt>
|  Copyright (c) 2016-2017 Alexander Gerasiov <gq@cs.msu.su>
|  Copyright (c) 2017 Dmitry Pavlov <zeldigas@gmail.com>
|  Copyright (c) 2024 Konstantin Romanov <kosta-codes@proton.me>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License version 3 as
published by the Free Software Foundation.
pip install restructuredtext-lint