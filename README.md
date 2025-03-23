# HexletCode

![CI](https://github.com/AndPewka/rails-project-63/actions/workflows/ci.yml/badge.svg)
[![hexlet-check](https://github.com/AndPewka/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/AndPewka/rails-project-63/actions)

A simple Ruby library for generating HTML tags.

## Installation

```bash
bundle install
```

## Usage

```
HexletCode::Tag.build('br')
# => <br>

HexletCode::Tag.build('img', src: 'path/to/image')
# => <img src="path/to/image">

HexletCode::Tag.build('input', type: 'submit', value: 'Save')
# => <input type="submit" value="Save">

HexletCode::Tag.build('label', for: 'email') { 'Email' }
# => <label for="email">Email</label>
```

## Development
```
make lint   # Run RuboCop
make test   # Run tests
```