# frozen_string_literal: true

module Ncba
  class KplcPostpaidValidation < Resource
    PATH = 'kplc-postpaid-validation'

    def call
      post_request(url: PATH, body: body)
    end

    private

    def body
      {
        meter_number: args[:meter_number]
      }
    end
  end
end
