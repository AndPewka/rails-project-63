# frozen_string_literal: true

module HexletCode
  class FormRenderer
    def self.render_html(builder)
      form_body = builder.form_body
      form_options = form_body[:form_options]
      inputs = form_body[:inputs]
      submit_data = form_body[:submit]

      Tag.build('form', form_options) do
        result = []
        inputs.map { |field_data| result << render_input(field_data) }
        result << render_submit(submit_data) if submit_data
        result.join
      end
    end

    def self.render_input(field_data)
      type = field_data[:as].to_s.capitalize
      klass_name = "HexletCode::Inputs::#{type}Input"

      klass = Object.const_get(klass_name)

      klass.new(field_data).render
    end

    def self.render_submit(submit_data)
      options = submit_data[:options]
      value = submit_data[:value]
      options[:value] ||= value
      options[:type] ||= 'submit'

      Tag.build('input', options)
    end
  end
end
