# frozen_string_literal: true

require "faraday"
require "faraday_middleware"

# Ncba
module Ncba
  # Client
  class Client
    attr_reader :api_user, :api_key, :adapter

    def initialize(api_user:, api_key:, adapter: Faraday.default_adapter)
      @api_key = api_key # ApiKey
      @api_user = api_user # APIUser
      @adapter = adapter
      @header = {
        'ApiKey': @api_key,
        'APIUser': @api_user
      }
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

    def connection
      @connection ||= Faraday.new do |conn|
        conn.url_prefix = "http://developers.cbagroup.com:4040"
        conn.request :json
        conn.response :json, content_type: "application/json"
        conn.adapter adapter
      end
    end
  end
end
