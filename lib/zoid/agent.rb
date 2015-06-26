require "faraday"
require "faraday_middleware"
require "httpclient"

module Zoid
  class Agent
    def initialize(url, options = {})
      @url = url
      @options = options
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

    def connection
      @connection ||= Faraday.new(@options.merge(:url => @url)) do |builder|
        builder.response :json

        builder.adapter :httpclient
      end
    end
  end
end
