require 'logger'

module TencentDocsSdk
  API_BASE_URL = 'https://docs.qq.com'.freeze

  class << self
    def configure
      yield config
    end

    def config
      @config ||= Config.new
    end

    def redis
      config.redis
    end

    def logger
      return @logger if defined?(@logger)

      @logger = if defined?(Rails) && Rails.logger
                  Rails.logger
                else
                  Logger.new(STDOUT)
                end
    end

    def http_timeout_options
      config.http_timeout_options || { write: 2, connect: 5, read: 10 }
    end
  end

  class Config
    attr_accessor :default_client_id, :default_client_secret,
                  :redis, :http_timeout_options, :logger
  end
end
