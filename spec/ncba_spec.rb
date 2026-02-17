# frozen_string_literal: true

RSpec.describe Ncba do
  it 'has a version number' do
    expect(Ncba::VERSION).to eq('1.0.0')
  end

  describe '.configure' do
    it 'yields the configuration' do
      Ncba.configure do |config|
        config.api_key = 'my_key'
        config.username = 'my_user'
        config.password = 'my_pass'
      end

      expect(Ncba.configuration.api_key).to eq('my_key')
      expect(Ncba.configuration.username).to eq('my_user')
      expect(Ncba.configuration.password).to eq('my_pass')
    end
  end

  describe '.reset_configuration!' do
    it 'resets configuration to defaults' do
      Ncba.configure { |c| c.api_key = 'old_key' }
      Ncba.reset_configuration!
      expect(Ncba.configuration.api_key).to be_nil
    end
  end

  describe 'error classes' do
    it 'defines typed error classes inheriting from Ncba::Error' do
      expect(Ncba::AuthenticationError.superclass).to eq(Ncba::Error)
      expect(Ncba::BadRequestError.superclass).to eq(Ncba::Error)
      expect(Ncba::ForbiddenError.superclass).to eq(Ncba::Error)
      expect(Ncba::NotFoundError.superclass).to eq(Ncba::Error)
      expect(Ncba::ServerError.superclass).to eq(Ncba::Error)
    end

    it 'all inherit from StandardError' do
      expect(Ncba::Error.superclass).to eq(StandardError)
    end
  end
end
