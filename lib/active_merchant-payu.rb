# -*- encoding : utf-8 -*-
require "active_merchant"

module ActiveMerchant
  module Billing
    class PayuGateway < Gateway
      self.homepage_url = 'http://www.payu.pl/'
      self.display_name = 'PayU'
      # The countries the gateway supports merchants from as 2 digit ISO country codes
      self.supported_countries = ['PL']
      self.default_currency = 'PLN'
      #accepted money format
      self.money_format = :cents
      

      def initialize(options = {})
        requires!(options, :key, :key2, :pos_auth_key, :pos_id)
        @options = options
        super
      end
      
      # Methods suggested to be supported by active_merchant
      # https://github.com/Shopify/active_merchant/blob/master/lib/active_merchant/billing/gateway.rb
      # 
      # purchase(money, creditcard, options = {})
      # authorize(money, creditcard, options = {})
      # capture(money, authorization, options = {})
      # void(identification, options = {})
      # credit(money, identification, options = {})
      def authorize(money, credit_card_or_reference, options = {})
        not_yet
      end

      def purchase(money, credit_card_or_reference, options = {})
        not_yet
      end

      def capture(money, authorization, options = {})
        not_yet
      end

      def void(identification, options = {})
        not_yet
      end

      def credit(money, identification, options = {})
        not_yet
      end

      private

      def not_yet
        raise 'Not implemented for PayU'
      end
      
    end
  end
end
