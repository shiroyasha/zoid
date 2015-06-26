module Zoid
  class Response
    attr_reader :status
    attr_reader :body

    def initialize(status, body)
      @status = status
      @body = process(body)
    end

    def process(value)
      case value
      when Array then process_array(value)
      when Hash  then process_hash(value)
      else value
      end
    end

    def process_array(array)
      processed_array = array.map { |el| process(el) }

      Zoid::Resources.new(processed_array)
    end

    def process_hash(hash)
      processed_hash = hash.map do |key, value|
        [key.to_s, process(value)]
      end.to_h

      Zoid::Resource.new(processed_hash)
    end
  end
end
