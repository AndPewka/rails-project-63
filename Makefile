.PHONY: build lint test

build:
	bundle install

lint:
	bundle exec rubocop

test:
	bundle exec rake test