# frozen_string_literal: true

module HexletCode
  module Tag
    SINGLE_TAGS = %w[area base br col embed hr img input link meta source track wbr].freeze

    def self.build(name, attrs = {})
      body = block_given? ? yield : ""

      raise ArgumentError, "Tag cannot be an ampty" if name.empty?

      single_tag = single?(name)

      raise ArgumentError, "Self-closing tag <#{name}> cannot have a body" if
        single_tag && !body.empty?

      attributes = add_attributes attrs

      single_tag ? "<#{name}#{attributes}>" : "<#{name}#{attributes}>#{body}</#{name}>"
    end

    def self.add_attributes(attrs = {})
      attributes = attrs.map { |k, v| "#{k}=\"#{v}\"" }.join(' ')
      " #{attributes}" unless attributes.empty?
    end

    def self.single?(tag)
      SINGLE_TAGS.include?(tag)
    end
  end
end
