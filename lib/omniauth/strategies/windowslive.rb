require 'omniauth/strategies/oauth2'

# http://msdn.microsoft.com/en-us/library/hh243647.aspx
# http://msdn.microsoft.com/en-us/library/hh243649.aspx

module OmniAuth
  module Strategies
    class Windowslive < OmniAuth::Strategies::OAuth2
      # Scopes and permissions => http://msdn.microsoft.com/en-us/library/hh243646.aspx
      DEFAULT_SCOPE = 'wl.basic,wl.emails,wl.photos'

      option :client_options, {
        :site => 'https://oauth.live.com',
        :authorize_url => '/authorize',
        :token_url => '/token'
      }

      option :authorize_params, {
        :response_type => 'token' # 'code'
      }

      option :name, 'windowslive'

      def request_phase
        super
      end

      uid { raw_info.parsed['id'] }

      info do
        {
          'id' => raw_info.parsed['id'],
          'name' => raw_info.parsed['name'],
          'first_name' => raw_info.parsed['first_name'],
          'last_name' => raw_info.parsed['last_name'],
          'gender' => raw_info.parsed['gender'],
          'link' => raw_info.parsed['link'],
          'locale' => raw_info.parsed['locale'],
          'updated_time' => raw_info.parsed['updated_time']
        }
      end

      extra do
        {
          'raw_info' => raw_info.parsed
        }
      end

      # http://msdn.microsoft.com/en-us/library/hh243649.aspx
      def raw_info
        request = 'https://apis.live.net/v5.0/me'
        # GET https://apis.live.net/v5.0/me?access_token=ACCESS_TOKEN
        # @raw_info ||= MultiJson.decode(access_token.get('/1/account/verify_credentials.json').body)
        access_token.options[:parse] = :json
        @raw_info ||= MultiJson.decode(access_token.get(request))
      end

      # Contacts http://msdn.microsoft.com/fr-fr/windowslive/hh561464
      def contacts_info
        request = "https://apis.live.net/v5.0/me/contacts" # "?limit=2&offset=3"
        @contacts_info ||= MultiJson.decode(access_token.get(request).body)
      end

    end
  end
end
OmniAuth.config.add_camelization 'windowslive', 'WindowsLive'