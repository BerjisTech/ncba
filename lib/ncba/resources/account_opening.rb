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
        "UniqueID": params[:uid],
        "CustomerCategory": params[:customer_category],
        "BusinessName": params[:business_name],
        "PreferedName": params[:prefered_name],
        "Street": params[:street],
        "TownCountry": params[:town_country],
        "Country": params[:country],
        "Sector": params[:sector],
        "Industry": params[:industry],
        "Nationality": params[:nationality],
        "CustEmailId": params[:email],
        "CustEmailId2": params[:emergency_email],
        "CustMobPhone": params[:phone_number],
        "Building": params[:building],
        "Website": params[:website],
        "BankName": params[:bank_name],
        "Branch": params[:branch],
        "AcctNum": params[:account_number],
        "BankAccountName": params[:bank_account_name],
        "AccountCurrency": params[:account_currency],
        "CbaAccount": params[:cba_account],
        "BankCode": params[:bank_code],
        "SwiftCode": params[:swift_code],
        "BusinessPhoneNumber": params[:business_phone_number],
        "PostalCode": params[:postal_code],
        "PostalAddress": params[:postal_address],
        "StakeHolder": {
          "Stakeholder": [
            {
              "DirShareholder": params[:stakeholder_director_shareholder],
              "StakeSurname": params[:stakeholder_surname],
              "StakeForename": params[:stakeholder_forename],
              "StakeSalutation": params[:stakeholder_salutation],
              "StakeGender": params[:stakeholder_gender],
              "StakeEmail1": params[:stakeholder_email],
              "StakeTel1": params[:stakeholder_phone],
              "StakePost": params[:stakeholder_postal_address],
              "StakeTown": params[:stakeholder_town],
              "StakePostCode": params[:stakeholder_postal_code],
              "StakeCountry": params[:stakeholder_country],
              "IDType": params[:stakeholder_id_type],
              "IDNumber": params[:stakeholder_id_number]
            }
          ]
        },
        "BusinesRegistrationNo": params[:brn]
      }
    end
  end
end
# rubocop:enable Metrics/MethodLength
