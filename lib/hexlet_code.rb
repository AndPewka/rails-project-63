# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload :Tag,          'hexlet_code/tag'
  autoload :FormRenderer, 'hexlet_code/form_renderer'
  autoload :FormBuilder,  'hexlet_code/form_builder'
  autoload :Inputs,       'hexlet_code/inputs'

  class Error < StandardError; end

  def self.form_for(entity, attributes = {})
    builder = FormBuilder.new(entity, **attributes)
    yield(builder) if block_given?
    FormRenderer.render_html(builder)
  end
end
