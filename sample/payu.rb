require "rubygems"
require "./config"

require "active_merchant"
require "active_merchant/billing/payu"


ActiveMerchant::Billing::Base.mode = :test
gateway = ActiveMerchant::Billing::PayuGateway.new()

