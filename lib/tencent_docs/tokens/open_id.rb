require 'tencent_docs/tokens/base'

module TencentDocsSdk
  module Tokens
    class OpenId < Base
      def redis_key
        @redis_key ||= Digest::MD5.hexdigest "#{self.class.name}_#{client.user_id}_#{client.nick_name}_#{client.avatar}"
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
