require 'tencent_docs/tokens/base'

module TencentDocs
  module Tokens
    class OpenId < Base
      def redis_key
        @redis_key ||= Digest::MD5.hexdigest "#{self.class.name}_#{client.user_id}"
      end

      def fetch_token
        client.oauth.get_token
      end

      def key
        'user_id'
      end
    end
  end
end