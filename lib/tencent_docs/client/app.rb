require 'tencent_docs/client/base'

module TencentDocs
  module Client
    class App < Base
      api_mount :oauth
      api_mount :file
      api_mount :folder
      api_mount :permission

      attr_reader :client_id, :client_secret, :user_id, :nick_name, :avatar, :open_id

      def initialize(options = {})
        super
        init_attrs :client_id, :client_secret, :user_id, :nick_name, :avatar
        @open_id = options[:open_id] || open_id_store.token
      end

      def access_token
        token_store.token
      end

      private

      def token_store
        @token_store ||= TencentDocs::Tokens::AppToken.new(self)
      end

      def open_id_store
        @open_id_store ||= TencentDocs::Tokens::OpenId.new(self)
      end
    end
  end
end
