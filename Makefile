help:
	@printf "%s\n"   "make test             Test linkcheck"
	@printf "%s\n"   "make lint             Lint source files with shellcheck"
	@printf "%s\n"   "make help             Show help"

test:
	./tests/test.sh

lint:
	shellcheck --shell=bash linkcheck
