module TencentDocsSdk
  module Tokens
    class Base
      attr_accessor :client

      def initialize(client)
        @client = client
        raise RedisNotConfigException if redis.nil?
      end

      def token
        update_token if expired?
        redis.hget(redis_key, key)
      end

      def valid?
        token.present?
      end

      def update_token
        data = fetch_token.data
        value = data[key]
        if value.nil?
          TencentDocsSdk.logger.error "#{self.class.name} fetch token error: #{data.inspect}"
        else
          expires_at = Time.now.to_i + data['expires_in'].to_i - 120
          redis.hmset(
            redis_key,
            key, value,
            'expires_at', expires_at
          )
          redis.expireat(redis_key, expires_at)
        end

        value
      end

      private

      def fetch_token
        raise NotImplementedError
      end

      def key
        'access_token'
      end

      def redis_key
        raise NotImplementedError
      end

      def redis
        TencentDocsSdk.redis
      end

      def expired?
        redis.hvals(redis_key).empty? || redis.hget(redis_key, 'expires_at').to_i <= Time.now.to_i
      end
    end
  end
end
