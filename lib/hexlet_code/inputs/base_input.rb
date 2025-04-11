# frozen_string_literal: true

module HexletCode
  module Inputs
    class BaseInput
      attr_reader :name, :value, :options

      def initialize(field_data)
        @name = field_data[:name]
        @value = field_data[:value]
        @options = field_data[:options].dup
      end

      def render
        raise NotImplementedError, 'Please implement `render` method in subclass'
      end
    end
  end
end
