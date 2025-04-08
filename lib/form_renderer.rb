# frozen_string_literal: true

module HexletCode
  class FormRenderer
    def self.render_html(builder)
      form_body = builder.form_body
      form_options = form_body[:form_options]
      inputs       = form_body[:inputs]
      submit_data  = form_body[:submit]

      Tag.build('form', form_options) do
        result = []

        inputs.map do |field_data|
          result << render_input(field_data)
        end

        result << render_submit(submit_data) if submit_data

        result.join
      end
    end

    def self.render_input(field_data)
      case field_data[:as]
      when :input then render_text_input(field_data)
      when :text  then render_textarea(field_data)
      else
        raise ArgumentError, "Unsupported input type: #{field_data[:as]}"
      end
    end

    def self.render_text_input(field_data)
      name    = field_data[:name]
      value   = field_data[:value]
      options = field_data[:options].dup

      options[:type] ||= 'text'
      options[:name] = name
      options[:value] = value

      label = Tag.build('label', for: name) { name.to_s.capitalize }
      input = Tag.build('input', options)

      label + input
    end

    def self.render_textarea(field_data)
      name    = field_data[:name]
      value   = field_data[:value]
      options = field_data[:options].dup

      options[:name] = name
      options[:rows] ||= 40
      options[:cols] ||= 20

      label = Tag.build('label', for: name) { name.to_s.capitalize }
      textarea = Tag.build('textarea', options) { value }

      label + textarea
    end

    def self.render_submit(submit_data)
      options = submit_data[:options]
      value   = submit_data[:value]

      options[:value] ||= value
      options[:type]  ||= 'submit'

      Tag.build('input', options)
    end
  end
end
