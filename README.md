[![Gem Version](https://badge.fury.io/rb/tencent-docs-sdk.svg)](https://badge.fury.io/rb/tencent-docs-sdk)

> Ruby SDKs for TencentDocs(腾讯文档) API https://open.tencent_docs.com/

## 安装

Add this line to your application's Gemfile:

```ruby
gem 'tencent-docs-sdk'
```

And then execute:

  $ bundle install

Or install it yourself as:

  $ gem install tencent-docs-sdk

  require 'tencent_docs/sdk'

## 使用说明

### 初始化 SDK

```ruby
# config/initializers/tencent_docs.rb

TencentDocs.configure do |config|
  config.redis = Redis.new
  # ...
end
```

### 实例化应用

```ruby
app = TencentDocs::Client::App.new(
  client_id: 'client_id',
  client_secret: 'client_secret',
  user_id: 'user_id',
  nick_name: 'nick_name',
  avatar: 'avatar'
)
app.oauth.get_token
```

## 贡献

如果你有好的意见或建议，欢迎给我们提 Issues 或 Pull requests

## License

The MIT License(http://opensource.org/licenses/MIT)

请自由地享受和参与开源
