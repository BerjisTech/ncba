# frozen_string_literal: true

require "faraday"
require "faraday_middleware"

# Ncba
module Ncba
  # Client
  class Client
    attr_reader :key, :secret, :adapter

    def initialize(key:, secret:, adapter: Faraday.default_adapter)
      @key = key
      @secret = secret
      @adapter = adapter
    end

    def open_account(**args)
      AccountOpening.new(self, args).call
    end

    def credit_details(**args)
      CreditDetails.new(self, args).call
    end

    def credit_transfer(**args)
      CreditTransfer.new(self, args).call
    end

    def mpesa_phone_number_validation(**args)
      MpesaPhoneNumberValidation.new(self, args).call
    end

    def transaction_query(**args)
      TransactionQuery.new(self, args).call
    end

    def connection(basic_auth: false)
      @connection ||= Faraday.new do |conn|
        conn.url_prefix = "http://developers.cbagroup.com:4040"
        conn.request :json
        conn.response :json, content_type: "application/json"
        conn.adapter adapter
        conn.request :basic_auth, key, secret if basic_auth
        conn.request :authorization, :Bearer, auth.access_token unless basic_auth
      end
    end
  end
end
