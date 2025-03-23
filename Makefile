.PHONY: build lint test

build:
	echo "Building..."
	bundle

lint:
	bundle exec rubocop

test:
	bundle exec rake test