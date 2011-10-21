# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name          = "active_merchant-payu"
  s.version       = "0.01"
  s.authors       = ["Michał Taberski"]
  s.email         = "michal.taberski@netguru.pl"
  s.homepage      = "http://github.com/netguru/active_merchant-payu"
  s.summary       = "Active Merchant gateway for PayU provider."
  s.description   = "PayU is a central europe payment provider. Active Merchant is payment gem released by Shopify."
  s.rubyforge_project = "active_merchant-payu"
  s.files         = `git ls-files`.split("\n")
  s.require_paths = ["lib"]
  s.add_dependency("activemerchant", "~> 1.18.1")
end
