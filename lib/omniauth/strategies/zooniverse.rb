require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Zooniverse < OmniAuth::Strategies::OAuth2
      # change the class name and the :name option to match your application name
      option :name, :zooniverse

      option :client_options, {
        :site => "https://panoptes-staging.zooniverse.org",
        :authorize_url => "/oauth/authorize",
      }

      uid { raw_info["id"] }

      info do
        {
          :email => raw_info["email"],
          :name  => raw_info["display_name"]
        }
      end

      def raw_info
        raw = JSON.parse(access_token.get('/api/me', headers: {'Accept' => "application/vnd.api+json; version=1"}).body)
        @raw_info ||= raw["users"][0]
      end
    end
  end
end
