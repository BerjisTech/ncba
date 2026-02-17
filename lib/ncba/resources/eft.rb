# frozen_string_literal: true

module Ncba
  class Eft < Resource
    PATH = 'eft'

    def call
      post_request(url: PATH, body: body)
    end

    private

    def body
      {
        source_account: args[:source_account],
        destination_account: args[:destination_account],
        destination_bank_code: args[:destination_bank_code],
        beneficiary_name: args[:beneficiary_name],
        amount: args[:amount],
        currency: args[:currency],
        narration: args[:narration],
        reference: args[:reference]
      }
    end
  end
end
