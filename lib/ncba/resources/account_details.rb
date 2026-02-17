# frozen_string_literal: true

module Ncba
  class AccountDetails < Resource
    PATH = 'account-details'

    def call
      post_request(url: PATH, body: body)
    end

    private

    def body
      {
        account_number: args[:account_number]
      }
    end
  end
end
