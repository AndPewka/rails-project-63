# frozen_string_literal: true

module HexletCode
  module Inputs
    class StringInput < BaseInput
      DEFAULT_TYPE = 'text'

      def render
        label = Tag.build('label', for: name) { name.to_s.capitalize }
        input = Tag.build(
          'input',
          {
            type: DEFAULT_TYPE,
            name: name,
            value: value
          }.merge(options)
        )
        label + input
      end
    end
  end
end
