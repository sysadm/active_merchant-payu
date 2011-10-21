
module ActiveMerchant
  module Billing
    class PayuGateway < AuthorizeNetGateway
      self.homepage_url = 'http://www.payu.pl/'
      self.display_name = 'PayU'
      # The countries the gateway supports merchants from as 2 digit ISO country codes
      self.supported_countries = ['PL']
      self.default_currency = 'PLN'
      #accepted money format
      self.money_format = :cents
      
      
      
    end
  end
end