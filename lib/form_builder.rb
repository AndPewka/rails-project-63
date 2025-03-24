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
      options[:name] = name
      options[:value] = value

      @fields << build_label(name) if %i[input text].include?(as)
      @fields << build_field(as, options)

      nil
    end

    def submit(value = "Save", **options)
      options[:type] ||= "submit"
      options[:value] ||= value
      @fields << build_field(:submit, options)

      nil
    end

    def render
      @fields.join
    end

    private

    def build_label(name)
      Tag.build("label", for: name) { name.to_s.capitalize }
    end

    def build_field(as, options)
      sorted_options = options.sort.to_h

      case as
      when :input
        build_input_field(sorted_options)
      when :text
        build_textarea_field(sorted_options)
      when :submit
        build_submit_field(sorted_options)
      else
        raise ArgumentError, "Unsupported input type: #{as}"
      end
    end

    def build_input_field(options)
      options[:type] = "text"
      Tag.build("input", options)
    end

    def build_textarea_field(options)
      options[:rows] ||= 40
      options[:cols] ||= 20
      Tag.build("textarea", options) { options.delete(:value) }
    end

    def build_submit_field(options)
      Tag.build("input", options)
    end
  end
end
