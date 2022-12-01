require 'tencent_docs/version'
require 'redis'
require 'active_support/all'
require 'tencent_docs/config'
require 'tencent_docs/errors'

lib_path = "#{File.dirname(__FILE__)}/tencent_docs"
Dir["#{lib_path}/api/**/*.rb",  "#{lib_path}/tokens/*.rb"].each { |path| require path }

require 'tencent_docs/client/app'
