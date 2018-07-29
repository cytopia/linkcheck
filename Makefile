help:
	@printf "%s\n"   "make test             Test the Ansible role"
	@printf "%s\n"   "make lint             Lint source files"
	@printf "%s\n"   "make help             Show help"

test:
	./linkcheck -r 10 -t 30 tests/

lint:
	shellcheck --shell=bash linkcheck
