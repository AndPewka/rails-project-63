# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'hexlet_code'

require 'minitest/autorun'

def load_fixture(name)
  path = File.join(__dir__, 'fixtures', name)
  File.read(path).strip.gsub("\n", '').gsub(/\s{2,}/, '')
end
