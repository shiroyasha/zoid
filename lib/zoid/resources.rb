module Zoid
  class Resources
    include Enumerable

    def initialize(resources)
      @resources = resources
    end

    def find_by(criteria)
      key   = criteria.keys.first
      value = criteria[key]

      @resources.find { |resource| resource.public_send(key) == value }
    end

    def each(&block)
      @resources.each(&block)
    end

    def [](index)
      @resources[index]
    end

  end
end
