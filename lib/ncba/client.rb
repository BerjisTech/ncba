# frozen_string_literal: true

require 'faraday'

module Ncba
  class Client
    attr_reader :api_key, :username, :password, :adapter
    attr_accessor :token

    def initialize(api_key: nil, username: nil, password: nil, adapter: Faraday.default_adapter)
      config = Ncba.configuration
      @api_key = api_key || config.api_key
      @username = username || config.username
      @password = password || config.password
      @adapter = adapter
      @token = nil
    end

    def authenticate
      response = Authentication.new(self).call
      @token = response['api_token'] || response['apiToken'] || response['token']
      raise AuthenticationError, 'No token returned from authentication' unless @token

      response
    end

    def account_details(**args)
      ensure_authenticated!
      AccountDetails.new(self, args).call
    end

    def mini_statement(**args)
      ensure_authenticated!
      MiniStatement.new(self, args).call
    end

    def account_statement(**args)
      ensure_authenticated!
      AccountStatement.new(self, args).call
    end

    def check_transaction_status(**args)
      ensure_authenticated!
      CheckTransactionStatus.new(self, args).call
    end

    def ift(**args)
      ensure_authenticated!
      Ift.new(self, args).call
    end

    def eft(**args)
      ensure_authenticated!
      Eft.new(self, args).call
    end

    def rtgs(**args)
      ensure_authenticated!
      Rtgs.new(self, args).call
    end

    def pesalink(**args)
      ensure_authenticated!
      Pesalink.new(self, args).call
    end

    def kplc_postpaid_validation(**args)
      ensure_authenticated!
      KplcPostpaidValidation.new(self, args).call
    end

    def kplc_postpaid(**args)
      ensure_authenticated!
      KplcPostpaid.new(self, args).call
    end

    def connection
      @connection ||= Faraday.new do |conn|
        conn.url_prefix = Ncba.configuration.base_url
        conn.request :json
        conn.response :json, content_type: /\bjson$/
        conn.adapter adapter
      end
    end

    private

    def ensure_authenticated!
      raise AuthenticationError, 'Not authenticated. Call client.authenticate first.' unless token
    end
  end
end
