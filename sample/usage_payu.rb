require "rubygems"
require "active_merchant-payu"

config = YAML.load_file("config.yml")

ActiveMerchant::Billing::Base.mode = :test
gateway = ActiveMerchant::Billing::PayuGateway.new(config['payu'].symbolize_keys!)


# puts gateway.generate_link(2, 'zam1', firstname = "M.", lastname = "T.", email = "m@t.com", ip = "127.0.0.1")
params = {
  :session_id => 'firstid-secondid-9c269069beb0e5f872c8a6c42b8bb327',
  :ts => '1319566746537',
  :posid => '93268',
  :sig => 'f0ec84fa2d528f194e3bc275d76e2c9d'
}
puts gateway.get_status(params)

# if credit_card.valid?
#   # or gateway.purchase to do both authorize and capture
#   response = gateway.authorize(1000, credit_card, :ip => "127.0.0.1")
#   if response.success?
#     gateway.capture(1000, response.authorization)
#     puts "Purchase complete!"
#   else
#     puts "Error: #{response.message}"
#   end
# else
#   puts "Error: credit card is not valid. #{credit_card.errors.full_messages.join('. ')}"
# end
