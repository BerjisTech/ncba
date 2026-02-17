# frozen_string_literal: true

require 'ncba'
require 'webmock/rspec'

RSpec.configure do |config|
  config.example_status_persistence_file_path = '.rspec_status'
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before do
    Ncba.reset_configuration!
    Ncba.configure do |c|
      c.api_key = 'test_api_key'
      c.username = 'test_user'
      c.password = 'test_pass'
    end
  end
end
