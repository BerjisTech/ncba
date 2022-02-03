# frozen_string_literal: true

module Ncba
  # Resource
  class Resource
    attr_reader :client, :args

    def initialize(client, args = {})
      @client = client
      @args = args
      @headers = { 'ApiKey': client.api_key, 'APIUser': client.api_user }
    end

    def get_request(url:, params: {}, headers: {})
      handle_response client.connection.get(url, params, @headers)
    end

    def post_request(url:, body: {}, headers: {})
      handle_response client.connection.post(url, body, @headers)
    end

    def handle_response(response)
      # case response.status
      # when 400
      #   raise Error, "Your request was malformed. #{response.body["errorMessage"]}"
      # when 401
      #   raise Error, "You did not supply valid authentication credentials. #{response.body["errorMessage"]}"
      # when 403
      #   raise Error, "You are not allowed to perform that action. #{response.body["errorMessage"]}"
      # when 404
      #   raise Error, "No results were found for your request. #{response.body["errorMessage"]}"
      # when 500
      #   raise Error, "Something wrong happened. #{response.body["errorMessage"]}"
      # end
      response
    end
  end
end
