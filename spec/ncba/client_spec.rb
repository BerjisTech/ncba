# frozen_string_literal: true

RSpec.describe Ncba::Client do
  let(:client) { described_class.new }
  let(:base_url) { Ncba::Configuration::SANDBOX_URL }

  describe '#initialize' do
    it 'uses configuration values by default' do
      expect(client.api_key).to eq('test_api_key')
      expect(client.username).to eq('test_user')
      expect(client.password).to eq('test_pass')
    end

    it 'allows overriding configuration via constructor' do
      custom = described_class.new(api_key: 'custom_key', username: 'custom_user', password: 'custom_pass')
      expect(custom.api_key).to eq('custom_key')
      expect(custom.username).to eq('custom_user')
      expect(custom.password).to eq('custom_pass')
    end

    it 'starts with no token' do
      expect(client.token).to be_nil
    end
  end

  describe '#authenticate' do
    it 'sets the token from the response' do
      stub_request(:post, "#{base_url}authenticate")
        .to_return(status: 200, body: { api_token: 'abc123' }.to_json,
                   headers: { 'Content-Type' => 'application/json' })

      client.authenticate
      expect(client.token).to eq('abc123')
    end

    it 'raises AuthenticationError when no token is returned' do
      stub_request(:post, "#{base_url}authenticate")
        .to_return(status: 200, body: {}.to_json,
                   headers: { 'Content-Type' => 'application/json' })

      expect { client.authenticate }.to raise_error(Ncba::AuthenticationError, /No token returned/)
    end

    it 'raises AuthenticationError on 401' do
      stub_request(:post, "#{base_url}authenticate")
        .to_return(status: 401, body: { message: 'Invalid credentials' }.to_json,
                   headers: { 'Content-Type' => 'application/json' })

      expect { client.authenticate }.to raise_error(Ncba::AuthenticationError)
    end
  end

  describe 'endpoint methods' do
    before do
      client.token = 'valid_token'
    end

    it 'raises AuthenticationError if not authenticated' do
      unauthenticated = described_class.new
      expect { unauthenticated.account_details(account_number: '123') }
        .to raise_error(Ncba::AuthenticationError, /Not authenticated/)
    end

    describe '#account_details' do
      it 'makes a POST request to account-details' do
        stub = stub_request(:post, "#{base_url}account-details")
               .with(headers: { 'Authorization' => 'Bearer valid_token' })
               .to_return(status: 200, body: { balance: '1000' }.to_json,
                          headers: { 'Content-Type' => 'application/json' })

        result = client.account_details(account_number: '123456')
        expect(stub).to have_been_requested
        expect(result).to eq({ 'balance' => '1000' })
      end
    end

    describe '#mini_statement' do
      it 'makes a POST request to mini-statement' do
        stub = stub_request(:post, "#{base_url}mini-statement")
               .to_return(status: 200, body: { transactions: [] }.to_json,
                          headers: { 'Content-Type' => 'application/json' })

        client.mini_statement(account_number: '123456')
        expect(stub).to have_been_requested
      end
    end

    describe '#account_statement' do
      it 'makes a POST request to account-statement' do
        stub = stub_request(:post, "#{base_url}account-statement")
               .to_return(status: 200, body: { statements: [] }.to_json,
                          headers: { 'Content-Type' => 'application/json' })

        client.account_statement(account_number: '123', start_date: '2025-01-01', end_date: '2025-01-31')
        expect(stub).to have_been_requested
      end
    end

    describe '#check_transaction_status' do
      it 'makes a POST request to check-transaction-status' do
        stub = stub_request(:post, "#{base_url}check-transaction-status")
               .to_return(status: 200, body: { status: 'completed' }.to_json,
                          headers: { 'Content-Type' => 'application/json' })

        client.check_transaction_status(reference_number: 'REF001')
        expect(stub).to have_been_requested
      end
    end

    describe '#ift' do
      it 'makes a POST request to ift' do
        stub = stub_request(:post, "#{base_url}ift")
               .to_return(status: 200, body: { reference: 'IFT001' }.to_json,
                          headers: { 'Content-Type' => 'application/json' })

        client.ift(source_account: '111', destination_account: '222', amount: 1000,
                   currency: 'KES', narration: 'Test', reference: 'REF')
        expect(stub).to have_been_requested
      end
    end

    describe '#eft' do
      it 'makes a POST request to eft' do
        stub = stub_request(:post, "#{base_url}eft")
               .to_return(status: 200, body: { reference: 'EFT001' }.to_json,
                          headers: { 'Content-Type' => 'application/json' })

        client.eft(source_account: '111', destination_account: '222', destination_bank_code: '01',
                   beneficiary_name: 'John', amount: 500, currency: 'KES', narration: 'Test', reference: 'REF')
        expect(stub).to have_been_requested
      end
    end

    describe '#rtgs' do
      it 'makes a POST request to rtgs' do
        stub = stub_request(:post, "#{base_url}rtgs")
               .to_return(status: 200, body: { reference: 'RTGS001' }.to_json,
                          headers: { 'Content-Type' => 'application/json' })

        client.rtgs(source_account: '111', destination_account: '222', destination_bank_code: '01',
                    beneficiary_name: 'John', amount: 50_000, currency: 'KES', narration: 'Test', reference: 'REF')
        expect(stub).to have_been_requested
      end
    end

    describe '#pesalink' do
      it 'makes a POST request to pesalink' do
        stub = stub_request(:post, "#{base_url}pesalink")
               .to_return(status: 200, body: { reference: 'PL001' }.to_json,
                          headers: { 'Content-Type' => 'application/json' })

        client.pesalink(source_account: '111', destination_account: '222', destination_bank_code: '404',
                        beneficiary_name: 'Jane', amount: 200, currency: 'KES', narration: 'Test', reference: 'REF')
        expect(stub).to have_been_requested
      end
    end

    describe '#kplc_postpaid_validation' do
      it 'makes a POST request to kplc-postpaid-validation' do
        stub = stub_request(:post, "#{base_url}kplc-postpaid-validation")
               .to_return(status: 200, body: { valid: true }.to_json,
                          headers: { 'Content-Type' => 'application/json' })

        client.kplc_postpaid_validation(meter_number: 'MTR001')
        expect(stub).to have_been_requested
      end
    end

    describe '#kplc_postpaid' do
      it 'makes a POST request to kplc-postpaid' do
        stub = stub_request(:post, "#{base_url}kplc-postpaid")
               .to_return(status: 200, body: { receipt: 'RCP001' }.to_json,
                          headers: { 'Content-Type' => 'application/json' })

        client.kplc_postpaid(source_account: '111', meter_number: 'MTR001', amount: 1000, reference: 'REF')
        expect(stub).to have_been_requested
      end
    end
  end

  describe '#connection' do
    it 'sets the base URL from configuration' do
      expect(client.connection.url_prefix.to_s).to eq(base_url)
    end
  end
end
