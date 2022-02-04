# frozen_string_literal: true

module Ncba
  # TransactionQuery
  class TransactionQuery < Resource
    PATH = '/api/TransactionQuery'

    def call
      post_request(url: PATH, body: body).body
    end

    def body
      {
        "Country": args[:country],
        "ReferenceNumber": args[:reference_number]
      }
    end
  end
end
