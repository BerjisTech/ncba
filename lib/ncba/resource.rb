# frozen_string_literal: true

module Ncba
  class Resource
    attr_reader :client, :args

    def initialize(client, args = {})
      @client = client
      @args = args
    end

    def get_request(url:, params: {})
      handle_response client.connection.get(url, params, auth_headers)
    end

    def post_request(url:, body: {})
      handle_response client.connection.post(url, body, auth_headers)
    end

    private

    def auth_headers
      { 'Authorization' => "Bearer #{client.token}" }
    end

    def handle_response(response)
      case response.status
      when 200, 201
        response.body
      when 400
        raise BadRequestError, error_message(response)
      when 401
        raise AuthenticationError, error_message(response)
      when 403
        raise ForbiddenError, error_message(response)
      when 404
        raise NotFoundError, error_message(response)
      when 500..599
        raise ServerError, error_message(response)
      else
        raise Error, error_message(response)
      end
    end

    def error_message(response)
      body = response.body
      message = body.is_a?(Hash) ? (body['message'] || body['errorMessage'] || body.to_s) : body.to_s
      "HTTP #{response.status}: #{message}"
    end
  end
end
