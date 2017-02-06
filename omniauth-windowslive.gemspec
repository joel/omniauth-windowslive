# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'omniauth/windowslive/version'

Gem::Specification.new do |s|
  s.name        = "omniauth-windowslive"
  s.version     = OmniAuth::Windowslive::VERSION
  s.authors     = ["Joel AZEMAR"]
  s.email       = ["joel.azemar@gmail.com"]
  s.homepage    = "https://github.com/joel/omniauth-windowslive"
  s.summary     = 'Windows Live, Hotmail, SkyDrive, Windows Live Messenger, and other services... strategy for OmniAuth'

  s.rubyforge_project = "omniauth-windowslive"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'omniauth-oauth2', '~> 1.4'
  s.add_dependency 'multi_json', '~> 1.12'

  s.add_development_dependency 'rspec', '~> 3.5'
  s.add_development_dependency 'rack-test'
  s.add_development_dependency 'webmock'
end
