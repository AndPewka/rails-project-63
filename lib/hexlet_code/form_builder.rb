# frozen_string_literal: true

module HexletCode
  class FormBuilder
    attr_reader :form_body

    def initialize(entity, **attributes)
      @entity = entity

      action = attributes.fetch(:url, '#')
      method = attributes.fetch(:method, 'post')

      @form_body = {
        form_options: {
          action: action,
          method: method
        }.merge(attributes.except(:url, :method)),
        inputs: []
      }
    end

    def input(name, **options)
      as = options.delete(:as) || :string
      value = @entity.public_send(name)

      @form_body[:inputs] << {
        name: name,
        value: value,
        as: as,
        options: options
      }
    end

    def submit(value = 'Save', **options)
      @form_body[:submit] = { value: value, options: options }
    end
  end
end
