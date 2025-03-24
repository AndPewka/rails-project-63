# frozen_string_literal: true

module HexletCode
  module Form
    def self.form_for(user, attrs = {})
      action = attrs.delete(:url).to_s
      attrs[:action] = action.empty? ? '#' : action
      attrs[:method] ||= 'post'

      builder = FormBuilder.new user

      yield(builder) if block_given?
      content = builder.render

      Tag.build('form', attrs) { content }
    end
  end
end
