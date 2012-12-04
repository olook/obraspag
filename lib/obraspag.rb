require "rubygems"
require "active_attr"
require "savon"

require "obraspag/webservice"
require "obraspag/connection"
require "obraspag/builders/address_builder"
require "obraspag/builders/authorize_transaction_request_builder"
require "obraspag/builders/credit_card_transaction_request_builder"
require "obraspag/builders/credit_card_builder"
require "obraspag/builders/customer_builder"
require "obraspag/models/address"
require "obraspag/models/customer"
require "obraspag/models/order"
require "obraspag/models/transaction_request"
require "obraspag/models/payments/payment"
require "obraspag/models/payments/credit_card"
require "obraspag/models/requests/authorize_transaction_request"
require "obraspag/models/requests/credit_card_transaction"

module Braspag

  def self.config_file_path=(path)
    @config_path = path
  end

  def self.config_file_path
    @config_path || 'config/braspag.yml'
  end

  CONTRACT_VERSION = '1.9'

  PAYMENT_METHOD = {
    #CARDS - BRASIL
    :amex_2p                  => 523,  # American Express 2 Party
    :cielo_visa               => 500, # Cielo webservice captura automática - Visa
    :cielo_mastercard         => 501, # Cielo webservice captura automática - Mastercard
    :cielo_amex               => 502,
    :cielo_diners             => 503,
    :cielo_elo                => 504,
    :redecard_visa            => 509,
    :redecard_mastercard      => 510,
    :redecard_diners          => 511,
    :sitef_amex               => 526,
    :sitef_hipercard          => 528,
    :sitef_aura               => 530,

    # STAGING
    :braspag => 997
  }



end
