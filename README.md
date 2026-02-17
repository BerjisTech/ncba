# NCBA

Ruby client for the NCBA Open Banking API. Supports token-based authentication, account queries, fund transfers (IFT, EFT, RTGS, Pesalink), and bill payments.

## Installation

Add to your Gemfile:

```ruby
gem 'ncba'
```

Then run:

```
$ bundle install
```

Or install directly:

```
$ gem install ncba
```

## Configuration

```ruby
Ncba.configure do |config|
  config.api_key = 'your_api_key'
  config.username = 'your_username'
  config.password = 'your_password'
  config.environment = :sandbox # or :production
end
```

## Usage

### Initialize and authenticate

```ruby
client = Ncba::Client.new
client.authenticate
```

You can also pass credentials directly:

```ruby
client = Ncba::Client.new(
  api_key: 'your_api_key',
  username: 'your_username',
  password: 'your_password'
)
client.authenticate
```

### Account queries

```ruby
# Account balance/details
client.account_details(account_number: '1234567890')

# Mini statement
client.mini_statement(account_number: '1234567890')

# Full statement by date range
client.account_statement(
  account_number: '1234567890',
  start_date: '2025-01-01',
  end_date: '2025-01-31'
)
```

### Transaction status

```ruby
client.check_transaction_status(reference_number: 'REF001')
```

### Fund transfers

```ruby
# Internal Fund Transfer (NCBA-to-NCBA)
client.ift(
  source_account: '1111111111',
  destination_account: '2222222222',
  amount: 1000,
  currency: 'KES',
  narration: 'Payment for services',
  reference: 'IFT-001'
)

# External Fund Transfer
client.eft(
  source_account: '1111111111',
  destination_account: '3333333333',
  destination_bank_code: '01',
  beneficiary_name: 'John Doe',
  amount: 5000,
  currency: 'KES',
  narration: 'Supplier payment',
  reference: 'EFT-001'
)

# RTGS (Real-Time Gross Settlement)
client.rtgs(
  source_account: '1111111111',
  destination_account: '4444444444',
  destination_bank_code: '02',
  beneficiary_name: 'Jane Smith',
  amount: 500_000,
  currency: 'KES',
  narration: 'Large transfer',
  reference: 'RTGS-001'
)

# Pesalink
client.pesalink(
  source_account: '1111111111',
  destination_account: '5555555555',
  destination_bank_code: '404',
  beneficiary_name: 'Bob Kamau',
  amount: 2000,
  currency: 'KES',
  narration: 'Pesalink transfer',
  reference: 'PL-001'
)
```

### Bill payments

```ruby
# KPLC postpaid validation
client.kplc_postpaid_validation(meter_number: 'MTR001')

# KPLC postpaid payment
client.kplc_postpaid(
  source_account: '1111111111',
  meter_number: 'MTR001',
  amount: 3000,
  reference: 'KPLC-001'
)
```

### Error handling

```ruby
begin
  client.account_details(account_number: '123')
rescue Ncba::AuthenticationError => e
  puts "Auth failed: #{e.message}"
rescue Ncba::BadRequestError => e
  puts "Bad request: #{e.message}"
rescue Ncba::NotFoundError => e
  puts "Not found: #{e.message}"
rescue Ncba::ServerError => e
  puts "Server error: #{e.message}"
rescue Ncba::Error => e
  puts "NCBA error: #{e.message}"
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bundle exec rake` to run tests and linting.

You can also run `bin/console` for an interactive prompt.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/BerjisTech/ncba.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
