# frozen_string_literal: true

module Ncba
  class AccountStatement < Resource
    PATH = 'account-statement'

    def call
      post_request(url: PATH, body: body)
    end

    private

    def body
      {
        account_number: args[:account_number],
        start_date: args[:start_date],
        end_date: args[:end_date]
      }
    end
  end
end
