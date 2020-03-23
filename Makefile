ifneq (,)
.error This Makefile requires GNU Make.
endif

# -------------------------------------------------------------------------------------------------
# Default configuration
# -------------------------------------------------------------------------------------------------
.PHONY: help test lint


# -------------------------------------------------------------------------------------------------
# Default Target
# -------------------------------------------------------------------------------------------------
help:
	@printf "%s\n"   "make test             Test linkcheck"
	@printf "%s\n"   "make lint             Lint source files with shellcheck"
	@printf "%s\n"   "make help             Show help"


# -------------------------------------------------------------------------------------------------
# Targets
# -------------------------------------------------------------------------------------------------
lint:
	docker run --rm -v $(PWD):/mnt koalaman/shellcheck:stable --shell=bash linkcheck

test:
	./tests/test.sh
