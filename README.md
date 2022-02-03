# Ncba API

The NCBA gem is a wrapper that helps developers interface with the official [NCBAOPEN BANKING API](http://developers.cbagroup.com:4040/home). 

<!-- Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/ncba` . To experiment with that code, run `bin/console` for an interactive prompt. -->

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ncba'
```

And then execute:

```
    $ bundle install
```

Or install it yourself as:

```
    $ gem install ncba
```

## Usage

```ruby
ncba_client = client = Ncba::Client.new(
  api_user: "your_user_name",
  api_key: "your_api_key"
)
```

NCBA accepts almost all variables as string except for `amount` which is float.

## Ncba:: Client:: AccountOpening

```ruby
ncba_client.account_opening(
    uid: "",
    customer_category: "",
    business_name: "",
    prefered_name: "",
    street: "",
    town_country: "",
    country: "",
    sector: "",
    industry: "",
    nationality: "",
    email: "",
    emergency_email: "",
    phone_number: "",
    building: "",
    website: "",
    bank_name: "",
    branch: "",
    account_number: "",
    bank_account_name: "",
    account_currency: "",
    cba_account: "",
    bank_code: "",
    swift_code: "",
    business_phone_number: "",
    postal_code: "",
    postal_address: "",
    stakeholder_director_shareholder: "",
    stakeholder_surname: "",
    stakeholder_forename: "",
    stakeholder_salutation: "",
    stakeholder_gender: "",
    stakeholder_email: "",
    stakeholder_phone: "",
    stakeholder_postal_address: "",
    stakeholder_town: "",
    stakeholder_postal_code: "",
    stakeholder_country: "",
    stakeholder_id_type: "",
    stakeholder_id_number: "",
    brn: ""
)
```

## Ncba:: Client:: CreditDetails

```ruby
ncba_client.credit_details(
    bizpawa_id: "",
    turnover_ratio: "",
    saas_payment_rate: "",
    payment_mode_rate: "",
    predictive_analysis: "",
    prev_loan_repayment_rate: "",
    pre_existing_cba_account: "",
    customer_bizpawa_age: "",
    inventory_turnover: "",
    director_listed_crb: "",
    business_listed_crb: "",
    bank_code: ""
)
```

## Ncba:: Client:: CreditTransfer

```ruby
ncba_client.credit_transfer(
    bank_code: "",
    bank_swift_code: "",
    branch_code: "",
    beneficiary_account_name: "",
    country: "",
    transaction_type: "",
    reference: "",
    currency: "",
    account: "",
    amount: "",
    narration: "",
    transaction_date: "",
    validation_id: "",
    sender_name: "",
    purpose_of_payment: "",
    sender_principle_activity: "",
    sender_address: "",
    receiver_address: "",
    receiver_id: "",
    sender_id: "",
    beneficiary_name: ""
)
```

## Ncba:: Client:: MpesaPhoneNumberValidation

```ruby
ncba_client.mpesa_phone_number_validation(
    mobile_number: "",
    reference: ""
)
```

## Ncba:: Client:: TransactionQuery

```ruby
ncba_client.transaction_query(
    country: "",
    reference_number: ""
)
```

<!-- ## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install` . To release a new version, update the version number in `version.rb` , and then run `bundle exec rake release` , which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org). -->

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/berjistech/ncba. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/berjistech/ncba/blob/main/CODE_OF_CONDUCT.md).

We follow the [GitHub Flow](https://guides.github.com/introduction/flow/index.html) model:

1. Check out this repo
1. Create your branch with a descriptive name, prefixed with the associated issue number (if any): `git checkout -b 10-branch-name`
1. Push the branch: `git push origin 10-branch-name`
1. Create a pull request. This will serve as the central location for implementation discussion and code reviews. Assign it to yourself and label as "In Progress".
1. Commit and push your changes: `git commit -am '[#10] added a feature'`
  + Please [write a good commit message](https://github.com/torvalds/subsurface/blob/f019f9453f93878f133cf9be1f480ce114ee2d1b/README#L87)
1. Once satisfied, get another developer to review the changes by assigning the PR to them and changing the label to "Needs Review". Once changes are approved and all tests/cops pass, merge to `main` and [deploy to Heroku](https://github.com/skyverge/shopstorm-app/wiki/Deploying%20to%20Heroku).

We assume that `main` is always deploy-ready.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Ncba project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/berjistech/ncba/blob/main/CODE_OF_CONDUCT.md).
