# frozen_string_literal: true

require_relative "ncba/version"

# Ncba
module Ncba
  class Error < StandardError; end

  autoload :Error, "ncba/error"
  autoload :Client, "ncba/client"
  autoload :Object, "ncba/object"
  autoload :Resource, "ncba/resource"
  autoload :SecurityCred, "ncba/securitycred"

  autoload :Register, "ncba/resources/register"
  autoload :Token, "ncba/resources/token"
  autoload :Stk, "ncba/resources/stk"
  autoload :Payout, "ncba/resources/payout"
  autoload :Status, "ncba/resources/status"
  autoload :Balance, "ncba/resources/balance"

  autoload :Instance, "ncba/objects/instace"
end
