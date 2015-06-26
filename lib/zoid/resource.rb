module Zoid
  class Resource
    def initialize(hash)
      @attributes = hash
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
  end
end
