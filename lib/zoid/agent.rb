require "faraday"
require "faraday_middleware"
require "httpclient"

module Zoid
  class Agent
    def initialize(url, options = {}, &connection_builder)
      @url = url

      @options = options
      @builder = connection_builder
    end

    def get(path, params = {})
      response = connection.get do |request|
        request.path = path
        request.headers['Content-Type'] = "application/json"
        request.params = params

        yield if block_given?
      end

      Zoid::Response.new(response.status, response.body)
    end

    private

    def connection(&block)
      @connection ||= Faraday.new(connection_options) do |builder|
        builder.response :json

        @builder.call(builder) if @builder

        builder.adapter :httpclient
      end
    end

    def connection_options
      @options.merge(:url => @url)
    end
  end
end
