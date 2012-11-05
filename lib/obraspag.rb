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

  #options = YAML.load_file(Braspag.config_file_path)

  #MERCHANT_ID = options['merchant_id']
  PAYMENT_METHOD = {
    #CARDS - BRASIL
    :amex_2p                  => 18,  # American Express 2 Party
    :cielo_noauth_visa        => 71,  # Cielo webservice captura automática sem autenticação - Visa
    :cielo_preauth_visa       => 73,  # Cielo webservice preauth sem autenticação - Visa
    :cielo_noauth_mastercard  => 120, # Cielo webservice captura automática sem autenticação - Mastercard
    :cielo_preauth_mastercard => 122, # Cielo webservice preauth sem autenticação - Mastercard
    :cielo_noauth_elo         => 126, # Cielo webservice captura automática sem autenticação - ELO
    :cielo_noauth_diners      => 130, # Cielo webservice captura automática sem autenticação - Diners
    :redecard                 => 20,  # Redecard Mastercard/Diners/Visa
    :redecard_preauth         => 42,  # Redecard preauth Mastercard/Diners/Visa
    :cielo_sitef              => 57,  # Cielo SITEF
    :hipercard_sitef          => 62,  # Hipercard SITEF
    :hipercard_moip           => 90,  # Hipercard MOIP
    :oi_paggo                 => 55,  # OiPaggo
    :amex_sitef               => 58,  # Amex SITEF
    :aura_dtef                => 37,  # Aura DTEF
    :redecard_sitef           => 44,  # Redecard SITEF - Mastercard/Diners
    #CARDS - MEXICO
    :mex_amex_2p            => 45, # American Express 2 Party
    :mex_banorte_visa       => 50, # Banorte Visa
    :mex_banorte_diners     => 52, # Banorte Diners
    :mex_banorte_mastercard => 53, # Banorte Mastercard
    #CARDS - COLOMBIA
    :col_visa   => 63, # Visa
    :col_amex   => 65, # Amex
    :col_diners => 66, # Diners
    # INTERNACIONAL
    :paypal_express => 35, # PayPal Express Checkout
    # STAGING
    :braspag => 997
  }



end
