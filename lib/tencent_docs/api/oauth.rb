module TencentDocsSdk
  module Api
    module Oauth
      # https://docs.qq.com/pdf/DZnl2dmFRbWJMVWdD?
      def get_token
        request.get '/oauth/v2/jwt/token',
          authorization: jwt_authorization,
          params: { client_id: client_id }
      end

      private

      def jwt_authorization
        now = Time.now.to_i
        payload = {
          user_id: user_id,
          nick_name: nick_name,
          avatar: avatar,
          exp: now + 60,
          iat: now
        }
        JWT.encode(payload, client_secret, 'HS256')
      end
    end
  end
end
