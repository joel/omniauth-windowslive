require 'omniauth/strategies/oauth2'

# http://msdn.microsoft.com/en-us/library/hh243647.aspx
# http://msdn.microsoft.com/en-us/library/hh243649.aspx

module OmniAuth
  module Strategies
    class Windowslive < OmniAuth::Strategies::OAuth2
      # Scopes and permissions => http://msdn.microsoft.com/en-us/library/hh243646.aspx
      DEFAULT_SCOPE = 'wl.basic,wl.emails,wl.photos'

      option :client_options, {
        :site => 'https://login.live.com',
        :authorize_url => '/oauth20_authorize.srf',
        :token_url => '/oauth20_token.srf'
      }

      option :authorize_params, {
        :response_type => 'code'
      }

      option :name, 'windowslive'

      uid { raw_info['id'] }

      # http://msdn.microsoft.com/en-us/library/hh243648.aspx
      info do
        {
          'id' => raw_info['id'],
          'name' => raw_info['name'],
          'first_name' => raw_info['first_name'],
          'last_name' => raw_info['last_name'],
          'gender' => raw_info['gender'],
          'link' => raw_info['link'],
          'locale' => raw_info['locale'],
          'updated_time' => raw_info['updated_time']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      # http://msdn.microsoft.com/en-us/library/hh243649.aspx
      def raw_info
        request = 'https://apis.live.net/v5.0/me'
        @raw_info ||= MultiJson.decode(access_token.get(request).body)
      end

    end
  end
end
OmniAuth.config.add_camelization 'windowslive', 'Windowslive'