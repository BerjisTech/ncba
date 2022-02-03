# frozen_string_literal: true

module Ncba
  # MpesaPhoneNumberValidation
  class MpesaPhoneNumberValidation < Resource
    PATH = "/api/MpesaPhoneNumberValidation"

    def call
      Object.new post_request(url: PATH, body: body).body
    end

    def body
      {
        "Mobile Number": args[:mobile_number],
        "Reference": args[:reference]
      }
    end
  end
end
