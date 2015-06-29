module Zoid
  class Resource
    def initialize(hash)
      @attributes = hash
    end

    def has?(attribute)
      @attributes.has_key?(attribute.to_s)
    end

    def respond_to_missing?(method, include_private = false)
      @attributes.has_key?[method.to_s]
    end

    def method_missing(method, *args)
      if @attributes.has_key?(method.to_s)
        @attributes[method.to_s]
      else
        super
      end
    end

    def methods
      super + @attributes.keys.map(&:to_sym)
    end
  end
end
