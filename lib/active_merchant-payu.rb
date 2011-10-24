# -*- encoding : utf-8 -*-
require "active_merchant"

module ActiveMerchant
  module Billing
    class PayuGateway < Gateway
      NEW_PAYMENT_URL = "https://www.platnosci.pl/paygw/UTF/NewPayment"
      
      self.homepage_url = 'http://www.payu.pl/'
      self.display_name = 'PayU'
      # The countries the gateway supports merchants from as 2 digit ISO country codes
      self.supported_countries = ['PL']
      self.default_currency = 'PLN'
      #accepted money format
      self.money_format = :cents
      

      def initialize(options = {})
        requires!(options, :key1, :key2, :pos_auth_key, :pos_id, :default_desc)
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
      
      
      def generate_link(amount, order_id, firstname = "", lastname = "", email = "", ip = "", desc = nil)  
        
        link = "#{NEW_PAYMENT_URL}?"
        { 
          :first_name => firstname,
          :last_name => lastname,
          :email => email,
          :pos_id => @options[:pos_id],
          :pos_auth_key => @options[:pos_auth_key],
          :amount => amount*100,
          :session_id => order_id + "-" + Digest::MD5.hexdigest(order_id.to_s + @options[:key1]).to_s,
          :client_ip => ip,
          :js => 1,
          :desc => desc || @options[:default_desc]
        }.each do |k,v|
          link << "#{k}=#{v}&"
        end
        URI.encode(link)
      end
      
      
      # {
      #   :pos_id => "",
      #   :pos_auth_key => "",
      #   :session_id => "",
      #   :amount => "",
      #   :desc => "",
      #   :first_name => "",
      #   :last_name => "",
      #   :email => "",
      #   :client_ip => ""
      # }
      # {
      #   :pay_type => "",
      #   :order_id => "",
      #   :desc2 => "",
      #   :trsDesc => "",
      #   :street => "",
      #   :street_hn => "",
      #   :street_an => "",
      #   :city => "",
      #   :post_code => "",
      #   :country => "",
      #   :country => "",
      #   :language => "",
      #   :js => "",
      #   :payback_login => "",
      #   :sig => "",
      #   :sig => ""
      # }
        
      # https://github.com/Shopify/active_merchant/blob/master/lib/active_merchant/billing/gateways/card_stream.rb
      # https://github.com/netguru/siepomaga/blob/master/app/models/payments/platnosci.rb
      def commit(action, parameters)
        
      end

      private

      def not_yet
        raise 'Not implemented for PayU'
      end
      
    end
  end
end
