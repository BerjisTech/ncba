# frozen_string_literal: true

# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength
module Ncba
  # CreditTransfer
  class CreditTransfer < Resource
    PATH = "/api/CreditTransfer"

    def call
      Object.new post_request(url: PATH, body: body).body
    end

    def body
      {
        "BankCode": args[:bank_code],
        "BankSwiftCode": args[:bank_swift_code],
        "BranchCode": args[:branch_code],
        "BeneficiaryAccountName": args[:beneficiary_account_name],
        "Country": args[:country],
        "TranType": args[:transaction_type],
        "Reference": args[:reference],
        "Currency": args[:currency],
        "Account": args[:account],
        "Amount": args[:amount].to_f,
        "Narration": args[:narration],
        "Transaction Date": args[:transaction_date],
        "Validation ID": args[:validation_id],
        "SenderName": args[:sender_name],
        "Purpose of Payment": args[:purpose_of_payment],
        "Sender Principle activity": args[:sender_principle_activity],
        "Sender Address": args[:sender_address],
        "Receiver Address": args[:receiver_address],
        "Receiver ID": args[:receiver_id],
        "Sender ID": args[:sender_id],
        "BeneficiaryName": args[:beneficiary_name]
      }
    end
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize
