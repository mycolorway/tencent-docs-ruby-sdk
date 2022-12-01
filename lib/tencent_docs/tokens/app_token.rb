require 'tencent_docs/tokens/base'

module TencentDocs
  module Tokens
    class AppToken < Base
      def redis_key
        @redis_key ||= Digest::MD5.hexdigest "#{self.class.name}_#{client.user_id}"
      end

      def fetch_token
        client.oauth.get_token
      end
    end
  end
end
