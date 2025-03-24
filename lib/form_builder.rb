# frozen_string_literal: true

module HexletCode
  class FormBuilder
    def initialize(user)
      @user = user
      @fields = []
    end

    def input(name, **options)
      as = options.delete(:as) || :input
      value = @user.public_send(name)
      options["name"] = name

      @fields << build_input(as, value, options)

      nil
    end

    def build_input(as, value, options)
      case as
      when :input
        options[:type] ||= "text"
        options[:value] = value
        Tag.build("input", options)
      when :text
        options[:rows] ||= 40
        options[:cols] ||= 20
        Tag.build("textarea", options) { value }
      else
        raise ArgumentError, "Unsupported input type: #{type}"
      end
    end

    def render
      @fields.join
    end
  end
end
