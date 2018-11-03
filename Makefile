help:
	@printf "%s\n"   "make test             Test linkcheck"
	@printf "%s\n"   "make lint             Lint source files with shellcheck"
	@printf "%s\n"   "make help             Show help"

test:
	./linkcheck -r 10 -t 30 tests/urls_valid_4.txt
	./linkcheck -r 10 -t 30 tests/urls_valid_4.txt | grep -c '[ok]'

lint:
	shellcheck --shell=bash linkcheck
