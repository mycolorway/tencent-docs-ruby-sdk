require 'tencent_docs/client/base'

module TencentDocsSdk
  module Client
    class App < Base
      api_mount :oauth
      api_mount :file
      api_mount :folder
      api_mount :permission

      attr_reader :client_id, :client_secret, :user_id, :nick_name, :avatar, :open_id

      def initialize(options = {})
        super
        init_attrs :user_id, :nick_name, :avatar
        @client_id = options[:client_id] || TencentDocsSdk.config.default_client_id
        @client_secret = options[:client_secret] || TencentDocsSdk.config.default_client_secret
        @open_id = options[:open_id] || open_id_store.token
      end

      def access_token
        token_store.token
      end

      private

      def token_store
        @token_store ||= TencentDocsSdk::Tokens::AppToken.new(self)
      end

      def open_id_store
        @open_id_store ||= TencentDocsSdk::Tokens::OpenId.new(self)
      end
    end
  end
end
