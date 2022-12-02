> Ruby SDKs for [TencentDocs(腾讯文档) API](https://docs.qq.com/open/document/app/)

## 安装

添加下面代码到应用的 Gemfile:

```ruby
gem 'tencent-docs-sdk', github: 'mycolorway/tencent-docs-ruby-sdk', branch: 'master'
```

然后执行:

```
$ bundle install
```

## 使用说明

### 初始化 SDK

```ruby
# config/initializers/tencent_docs.rb
TencentDocs.configure do |config|
  config.redis = Redis.new
  config.default_client_id     = 'xxx' # 应用 client ID
  config.default_client_secret = 'xxx' # 应用 client secret
end
```

### 实例化应用

```ruby
user_client = TencentDocs::Client::App.new(
  client_id: 'client_id',
  client_secret: 'client_secret',
  user_id: 'user_id',
  nick_name: 'nick_name',
  avatar: 'avatar'
)
```

### 使用 API

```ruby
## 文档操作

# 新建文档
user_client.file.create(title: 'title', type: 'doc')

# 查询文档
user_client.file.query(file_id: 'file_id')

# 打开文档
user_client.file.temp_url(file_id: 'file_id')

# 生成副本
user_client.file.copy(file_id: 'file_id', title: 'title')

# 重命名
user_client.file.rename(file_id: 'file_id', title: 'title')

# 删除文档
user_client.file.destroy(file_id: 'file_id')

# 恢复文档
user_client.file.recover(file_id: 'file_id')

# 导出文档
user_client.file.async_export(file_id: 'file_id')

# 导出进度查询
user_client.file.export_progress(file_id: 'file_id', operation_id: 'operation_id')


## 文档权限

# 查看用户访问权限
user_client.permission.access(file_id: 'file_id')

# 转让文档所有权
user_client.permission.trans(file_id: 'file_id', owner_id: 'open_id')

# 查看文档权限
user_client.permission.get_permission(file_id: 'file_id')

# 设置文档权限
user_client.permission.set_permission(file_id: 'file_id', policy: 'members')

# 添加协作成员
user_client.permission.add_collaborators(file_id: 'file_id', collaborators: [{ type: 'user', role: 'writer', id: 'open_id'}])

# 移除协作成员
user_client.permission.delete_collaborators(file_id: 'file_id', open_id: 'open_id')

# 查询协作成员
user_client.permission.list_collaborators(file_id: 'file_id')
```

## 贡献

如果你有好的意见或建议，欢迎给我们提 Issues 或 Pull requests

## License

The MIT License(http://opensource.org/licenses/MIT)

请自由地享受和参与开源
