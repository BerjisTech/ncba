# frozen_string_literal: true

module Ncba
  class Object
    attr_reader :attributes

    def initialize(attributes = {})
      @attributes = attributes
    end

    def method_missing(method, *, &)
      key = method.to_s
      if attributes.key?(key)
        value = attributes[key]
        value.is_a?(Hash) ? Object.new(value) : value
      else
        super
      end
    end

    def respond_to_missing?(method, include_private = false)
      attributes.key?(method.to_s) || super
    end

    def [](key)
      attributes[key.to_s]
    end

    def to_h
      attributes
    end
  end
end
