# frozen_string_literal: true

module Ncba
  class Authentication < Resource
    PATH = 'authenticate'

    def call
      body = {
        api_key: client.api_key,
        username: client.username,
        password: client.password
      }
      handle_response client.connection.post(PATH, body)
    end
  end
end
