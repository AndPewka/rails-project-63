# frozen_string_literal: true

module HexletCode
  module Inputs
    class TextInput < BaseInput
      DEFAULT_COLS = 20
      DEFAULT_ROWS = 40

      def render
        label = Tag.build('label', for: name) { name.to_s.capitalize }

        text_attrs = {
          rows: options.fetch(:rows, DEFAULT_ROWS),
          cols: options.fetch(:cols, DEFAULT_COLS),
          name: name
        }.merge(options)

        textarea = Tag.build('textarea', text_attrs) { value }
        label + textarea
      end
    end
  end
end
