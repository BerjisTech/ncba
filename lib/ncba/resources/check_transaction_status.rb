# frozen_string_literal: true

module Ncba
  class CheckTransactionStatus < Resource
    PATH = 'check-transaction-status'

    def call
      post_request(url: PATH, body: body)
    end

    private

    def body
      {
        reference_number: args[:reference_number]
      }
    end
  end
end
