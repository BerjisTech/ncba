# frozen_string_literal: true

module Ncba
  class Configuration
    SANDBOX_URL = 'https://sandbox.ncbagroup.com/api/'
    PRODUCTION_URL = 'https://api.ncbagroup.com/api/'

    attr_accessor :api_key, :username, :password, :environment

    def initialize
      @environment = :sandbox
    end

    def base_url
      case environment
      when :production
        PRODUCTION_URL
      else
        SANDBOX_URL
      end
    end
  end
end
