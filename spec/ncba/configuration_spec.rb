# frozen_string_literal: true

RSpec.describe Ncba::Configuration do
  subject(:config) { described_class.new }

  describe '#environment' do
    it 'defaults to :sandbox' do
      expect(config.environment).to eq(:sandbox)
    end
  end

  describe '#base_url' do
    it 'returns sandbox URL by default' do
      expect(config.base_url).to eq(Ncba::Configuration::SANDBOX_URL)
    end

    it 'returns production URL when environment is :production' do
      config.environment = :production
      expect(config.base_url).to eq(Ncba::Configuration::PRODUCTION_URL)
    end
  end

  describe 'credential accessors' do
    it 'allows setting and reading api_key' do
      config.api_key = 'key123'
      expect(config.api_key).to eq('key123')
    end

    it 'allows setting and reading username' do
      config.username = 'user'
      expect(config.username).to eq('user')
    end

    it 'allows setting and reading password' do
      config.password = 'pass'
      expect(config.password).to eq('pass')
    end
  end
end
