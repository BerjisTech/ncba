# frozen_string_literal: true

require_relative "ncba/version"

# Ncba
module Ncba
  class Error < StandardError; end

  autoload :Error, "ncba/error"
  autoload :Client, "ncba/client"
  autoload :Object, "ncba/object"
  autoload :Resource, "ncba/resource"

  autoload :AccountOpening, "ncba/resources/account_opening"
  autoload :CreditDetails, "ncba/resources/credit_details"
  autoload :CreditTransfer, "ncba/resources/credit_transfer"
  autoload :MpesaPhoneNumberValidation, "ncba/resources/mpesa_phone_number_validation"
  autoload :TransactionQuery, "ncba/resources/transaction_query"

  autoload :Instance, "ncba/objects/instace"
end
