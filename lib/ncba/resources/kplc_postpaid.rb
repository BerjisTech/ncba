# frozen_string_literal: true

module Ncba
  class KplcPostpaid < Resource
    PATH = 'kplc-postpaid'

    def call
      post_request(url: PATH, body: body)
    end

    private

    def body
      {
        source_account: args[:source_account],
        meter_number: args[:meter_number],
        amount: args[:amount],
        reference: args[:reference]
      }
    end
  end
end
