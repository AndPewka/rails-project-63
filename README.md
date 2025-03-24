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

result = HexletCode.form_for @user do |f|
    f.input :name
end
# => <form action=\"#\" method=\"post\"><input name=\"name\" type=\"text\" value=\"Andrey\"></form>

result = HexletCode.form_for @user do |f|
    f.input :name
    f.input :job
end
# => <form action=\"#\" method=\"post\"><input name=\"name\" type=\"text\" value=\"Andrey\"><input name=\"job\" type=\"text\" value=\"unemployed\"></form>

result = HexletCode.form_for @user do |f|
    f.input :name
    f.submit
end
# => <form action=\"#\" method=\"post\"><label for=\"name\">Name</label><input name=\"name\" value=\"Andrey\" type=\"text\"><input type=\"submit\" value=\"Save\"></form>

```

## Development
```
make lint   # Run RuboCop
make test   # Run tests
```