# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "active_merchant-payu"
  s.version     = "0.01"
  s.authors     = ["michaltaberski"]
  s.email       = ["xtrol87@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Active Merchang gateway for PayU provider.}
  s.description = %q{PayU is a central europe payment provider. Active Merchant is payment gem relased by Shopify.}

  s.rubyforge_project = "active_merchant-payu"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  spec.add_dependency("activemerchant", "~> 1.18.1")
  
end
