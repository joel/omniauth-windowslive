require 'omniauth/windowslive'
require 'bundler/setup'
require 'coveralls'

begin
  require 'pry'
rescue LoadError
end

require 'rack/test'

Coveralls.wear!

Dir[File.expand_path('../support/**/*', __FILE__)].each { |f| require f }

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.extend  OmniAuth::Test::StrategyMacros, type: :strategy

  OmniAuth.config.test_mode = true
end
