# frozen_string_literal: true

module Ncba
  class Ift < Resource
    PATH = 'ift'

    def call
      post_request(url: PATH, body: body)
    end

    private

    def body
      {
        source_account: args[:source_account],
        destination_account: args[:destination_account],
        amount: args[:amount],
        currency: args[:currency],
        narration: args[:narration],
        reference: args[:reference]
      }
    end
  end
end
