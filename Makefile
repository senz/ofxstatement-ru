TEST_SELECTOR_OPTS :=
ifneq ($(selector),)
        TEST_SELECTOR_OPTS := -k "$(selector)"
endif

all:
	@echo "Use a specific goal. To list all goals, type 'make help'"

.PHONY: install # Install dependencies
install:
	@poetry self add 'poetry-dynamic-versioning[plugin]'
	@poetry install --all-extras

.PHONY: build # Builds application artifacts
build:
	@$(MAKE) clean
	@python3 -m build --wheel

.PHONY: test # Runs tests; optional arguments:~selector=[test selector expression]: only run tests which match the given substring expression. An expression is a python evaluatable expression where all names are substring-matched against test names and their parent classes. Example: 'test_method or test_other' matches all test functions and classes whose name contains 'test_method' or 'test_other', while 'not test_method' matches those that don't contain 'test_method' in their names.
test:
	@pytest --cache-clear --capture=no $(TEST_SELECTOR_OPTS) -m "$(marker)" --cov=src --cov-append --cov-report xml:coverage.xml ./src

.PHONY: unit-test # Runs unit tests; optional arguments:~selector=[test selector expression]: only run tests which match the given substring expression. An expression is a python evaluatable expression where all names are substring-matched against test names and their parent classes. Example: 'test_method or test_other' matches all test functions and classes whose name contains 'test_method' or 'test_other', while 'not test_method' matches those that don't contain 'test_method' in their names.
unit-test:
	@$(MAKE) test marker="not integration"

.PHONY: integration-test # Runs integration tests; optional arguments:~selector=[test selector expression]: only run tests which match the given substring expression. An expression is a python evaluatable expression where all names are substring-matched against test names and their parent classes. Example: 'test_method or test_other' matches all test functions and classes whose name contains 'test_method' or 'test_other', while 'not test_method' matches those that don't contain 'test_method' in their names.
integration-test:
	@$(MAKE) test marker="integration"

.PHONY: code-format # Formats code
code-format:
	@black .

.PHONY: static-analysis # Runs static analysis
static-analysis:
	@prospector --profile ./prospector.yaml src
	@rst-lint .

.PHONY: security-analysis # Runs security analysis looking for vulnerabilities in code; required arguments:~file=[file path]: the file to analyze
security-analysis:
	@bandit -r src -x src/test

.PHONY: clean # Cleans up build directories
clean:
	@$(RM) -rf .pytest_cache
	@$(RM) -rf dist
	@$(RM) -rf build
	@$(RM) -rf src/*.egg-info
	@$(RM) .coverage

# .PHONY: get-project-metadata # Prints the given key from project metadata
# get-project-metadata:
# 	@grep -m 1 $(key) pyproject.toml | tr -s ' ' | tr -d '"' | tr -d "'" | cut -d' ' -f3
