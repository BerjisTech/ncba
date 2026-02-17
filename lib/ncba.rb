# frozen_string_literal: true

require_relative 'ncba/version'

module Ncba
  class Error < StandardError; end
  class AuthenticationError < Error; end
  class BadRequestError < Error; end
  class ForbiddenError < Error; end
  class NotFoundError < Error; end
  class ServerError < Error; end

  autoload :Client, 'ncba/client'
  autoload :Configuration, 'ncba/configuration'
  autoload :Object, 'ncba/object'
  autoload :Resource, 'ncba/resource'

  autoload :Authentication, 'ncba/resources/authentication'
  autoload :AccountDetails, 'ncba/resources/account_details'
  autoload :MiniStatement, 'ncba/resources/mini_statement'
  autoload :AccountStatement, 'ncba/resources/account_statement'
  autoload :CheckTransactionStatus, 'ncba/resources/check_transaction_status'
  autoload :Ift, 'ncba/resources/ift'
  autoload :Eft, 'ncba/resources/eft'
  autoload :Rtgs, 'ncba/resources/rtgs'
  autoload :Pesalink, 'ncba/resources/pesalink'
  autoload :KplcPostpaidValidation, 'ncba/resources/kplc_postpaid_validation'
  autoload :KplcPostpaid, 'ncba/resources/kplc_postpaid'

  autoload :Instance, 'ncba/objects/instance'

  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end

    def reset_configuration!
      @configuration = Configuration.new
    end
  end
end
