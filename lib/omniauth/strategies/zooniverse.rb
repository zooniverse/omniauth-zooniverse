require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Zooniverse < OmniAuth::Strategies::OAuth2
      # change the class name and the :name option to match your application name
      option :name, :zooniverse

      BASE_SCOPES = %w[user public]
      DEFAULT_SCOPE = "user,public"

      option :client_options, {
        :site => "https://panoptes.zooniverse.org",
        :authorize_url => "/oauth/authorize",
        :scope => "user, public"
      }

      uid { raw_info["id"] }

      option :authorize_options, [:user, :public]


      def authorize_params
        super.tap do |params|
          options[:authorize_options].each do |k|
            params[k] = request.params[k.to_s] unless [nil, ''].include?(request.params[k.to_s])
          end

          raw_scope = params[:scope] || DEFAULT_SCOPE
          scope_list = raw_scope.split(" ").map {|item| item.split(",")}.flatten
          scope_list.map! { |s| s =~ /^https?:\/\// || BASE_SCOPES.include?(s) ? s : "#{BASE_SCOPE_URL}#{s}" }
          params[:scope] = scope_list.join(" ")
        end
      end

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
