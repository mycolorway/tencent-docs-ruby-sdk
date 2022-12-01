require 'tencent_docs/client/base'

module TencentDocs
  module Client
    class App < Base
      api_mount :oauth

      attr_reader :client_id, :client_secret, :user_id, :nick_name, :avatar

      def initialize(options = {})
        super
        init_attrs :client_id, :client_secret, :user_id, :nick_name, :avatar
      end

      def access_token
        token_store.token
      end

      private

      def token_store
        @token_store ||= TencentDocs::Tokens::AppToken.new(self)
      end
    end
  end
end
