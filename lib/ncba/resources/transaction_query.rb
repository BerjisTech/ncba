# frozen_string_literal: true

module Ncba
  # TransactionQuery
  class TransactionQuery
    PATH = "/api/TransactionQuery"

    def call
      Object.new post_request(url: PATH, body: body).body
    end

    def body
      {
        "Country": args[:country],
        "ReferenceNumber": args[:reference_number]
      }
    end
  end
end
