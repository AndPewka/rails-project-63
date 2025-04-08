# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload :Tag, "#{__dir__}/tag"
  autoload :FormRenderer, "#{__dir__}/form_renderer"
  autoload :FormBuilder, "#{__dir__}/form_builder"

  class Error < StandardError; end

  def self.form_for(entity, attributes = {})
    builded_form = FormBuilder.new(entity, **attributes)

    yield(builded_form) if block_given?

    FormRenderer.render_html(builded_form)
  end
end
