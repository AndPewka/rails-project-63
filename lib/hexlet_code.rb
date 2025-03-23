# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  autoload :Tag, "#{__dir__}/tag"

  class Error < StandardError; end
end
