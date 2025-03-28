# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload :Tag, "#{__dir__}/tag"
  autoload :Form, "#{__dir__}/form"
  autoload :FormBuilder, "#{__dir__}/form_builder"

  def self.form_for(...)
    Form.form_for(...)
  end

  class Error < StandardError; end
end
