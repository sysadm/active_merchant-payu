require "rubygems"
require "./config"

require "active_merchant-payu"
require "active_merchant"


ActiveMerchant::Billing::Base.mode = :test
gateway = ActiveMerchant::Billing::PayuGateway.new()

