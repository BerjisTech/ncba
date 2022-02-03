# frozen_string_literal: true

# rubocop:disable Metrics/MethodLength
module Ncba
  # Account opening
  class AccountOpening < Resource
    PATH = "/api/AccountOpening"
    def call
      Object.new post_request(url: PATH, body: body).body
    end

    def body
      {
        "UniqueID": args[:uid],
        "CustomerCategory": args[:customer_category],
        "BusinessName": args[:business_name],
        "PreferedName": args[:prefered_name],
        "Street": args[:street],
        "TownCountry": args[:town_country],
        "Country": args[:country],
        "Sector": args[:sector],
        "Industry": args[:industry],
        "Nationality": args[:nationality],
        "CustEmailId": args[:email],
        "CustEmailId2": args[:emergency_email],
        "CustMobPhone": args[:phone_number],
        "Building": args[:building],
        "Website": args[:website],
        "BankName": args[:bank_name],
        "Branch": args[:branch],
        "AcctNum": args[:account_number],
        "BankAccountName": args[:bank_account_name],
        "AccountCurrency": args[:account_currency],
        "CbaAccount": args[:cba_account],
        "BankCode": args[:bank_code],
        "SwiftCode": args[:swift_code],
        "BusinessPhoneNumber": args[:business_phone_number],
        "PostalCode": args[:postal_code],
        "PostalAddress": args[:postal_address],
        "StakeHolder": {
          "Stakeholder": [
            {
              "DirShareholder": args[:stakeholder_director_shareholder],
              "StakeSurname": args[:stakeholder_surname],
              "StakeForename": args[:stakeholder_forename],
              "StakeSalutation": args[:stakeholder_salutation],
              "StakeGender": args[:stakeholder_gender],
              "StakeEmail1": args[:stakeholder_email],
              "StakeTel1": args[:stakeholder_phone],
              "StakePost": args[:stakeholder_postal_address],
              "StakeTown": args[:stakeholder_town],
              "StakePostCode": args[:stakeholder_postal_code],
              "StakeCountry": args[:stakeholder_country],
              "IDType": args[:stakeholder_id_type],
              "IDNumber": args[:stakeholder_id_number]
            }
          ]
        },
        "BusinesRegistrationNo": args[:brn]
      }
    end
  end
end
# rubocop:enable Metrics/MethodLength
