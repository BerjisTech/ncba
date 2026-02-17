# frozen_string_literal: true

RSpec.describe Ncba::Resource do
  let(:client) { Ncba::Client.new }
  let(:base_url) { Ncba::Configuration::SANDBOX_URL }

  before { client.token = 'test_token' }

  describe '#get_request' do
    it 'includes the authorization header' do
      stub = stub_request(:get, "#{base_url}test")
             .with(headers: { 'Authorization' => 'Bearer test_token' })
             .to_return(status: 200, body: { ok: true }.to_json,
                        headers: { 'Content-Type' => 'application/json' })

      resource = described_class.new(client)
      resource.get_request(url: 'test')
      expect(stub).to have_been_requested
    end
  end

  describe '#post_request' do
    it 'includes the authorization header' do
      stub = stub_request(:post, "#{base_url}test")
             .with(headers: { 'Authorization' => 'Bearer test_token' })
             .to_return(status: 200, body: { ok: true }.to_json,
                        headers: { 'Content-Type' => 'application/json' })

      resource = described_class.new(client)
      resource.post_request(url: 'test', body: { data: 'value' })
      expect(stub).to have_been_requested
    end
  end

  describe 'error handling' do
    let(:resource) { described_class.new(client) }

    it 'raises BadRequestError on 400' do
      stub_request(:post, "#{base_url}test")
        .to_return(status: 400, body: { message: 'Bad request' }.to_json,
                   headers: { 'Content-Type' => 'application/json' })

      expect { resource.post_request(url: 'test') }.to raise_error(Ncba::BadRequestError, /Bad request/)
    end

    it 'raises AuthenticationError on 401' do
      stub_request(:post, "#{base_url}test")
        .to_return(status: 401, body: { message: 'Unauthorized' }.to_json,
                   headers: { 'Content-Type' => 'application/json' })

      expect { resource.post_request(url: 'test') }.to raise_error(Ncba::AuthenticationError, /Unauthorized/)
    end

    it 'raises ForbiddenError on 403' do
      stub_request(:post, "#{base_url}test")
        .to_return(status: 403, body: { message: 'Forbidden' }.to_json,
                   headers: { 'Content-Type' => 'application/json' })

      expect { resource.post_request(url: 'test') }.to raise_error(Ncba::ForbiddenError, /Forbidden/)
    end

    it 'raises NotFoundError on 404' do
      stub_request(:post, "#{base_url}test")
        .to_return(status: 404, body: { message: 'Not found' }.to_json,
                   headers: { 'Content-Type' => 'application/json' })

      expect { resource.post_request(url: 'test') }.to raise_error(Ncba::NotFoundError, /Not found/)
    end

    it 'raises ServerError on 500' do
      stub_request(:post, "#{base_url}test")
        .to_return(status: 500, body: { message: 'Internal error' }.to_json,
                   headers: { 'Content-Type' => 'application/json' })

      expect { resource.post_request(url: 'test') }.to raise_error(Ncba::ServerError, /Internal error/)
    end

    it 'returns parsed body on success' do
      stub_request(:post, "#{base_url}test")
        .to_return(status: 200, body: { data: 'value' }.to_json,
                   headers: { 'Content-Type' => 'application/json' })

      result = resource.post_request(url: 'test')
      expect(result).to eq({ 'data' => 'value' })
    end
  end
end
