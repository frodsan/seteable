default: test

install:
	@cat .gems | xargs gem install

test:
	@cutest ./test/all.rb

.PHONY: test
