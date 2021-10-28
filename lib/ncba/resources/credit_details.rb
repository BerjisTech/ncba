# frozen_string_literal: true

# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength
module Ncba
  # CreditDetails
  class CreditDetails
    PATH = "/api/CreditDetails"

    def call
      Object.new post_request(url: PATH, body: body).body
    end

    def body
      {
        "BizpawaID": args[:bizpawa_id],
        "TurnoverRatio": args[:turnover_ratio],
        "SaasPaymentRate": args[:saas_payment_rate],
        "PaymentModeRatio": args[:payment_mode_rate],
        "PredictiveAnalysis": args[:predictive_analysis],
        "PrevLoanRepaymentRate": args[:prev_loan_repayment_rate],
        "PreExistingCBAAccount": args[:pre_existing_cba_account],
        "CustomerBizpawaAge": args[:customer_bizpawa_age],
        "InventoryTurnover": args[:inventory_turnover],
        "DirectorListedCRB": args[:director_listed_crb],
        "BusinessListedCRB": args[:business_listed_crb],
        "Amount": args[:bank_code].to_f,
        "CheckCRB": true
      }
    end
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize
