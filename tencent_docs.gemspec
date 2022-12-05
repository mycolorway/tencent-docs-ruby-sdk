require_relative 'lib/tencent_docs/version'

Gem::Specification.new do |spec|
  spec.name          = 'tencent_docs-sdk'
  spec.version       = TencentDocs::VERSION
  spec.authors       = ['euxx']
  spec.email         = ['euxuuu@gmail.com']

  spec.summary       = 'TencentDocs(腾讯文档) API SDKs for Ruby'
  spec.description   = 'TencentDocs(腾讯文档) API SDKs for Ruby https://docs.qq.com/open/document/app/'
  spec.homepage      = 'https://github.com/mycolorway/tencent-docs-ruby-sdk'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['allowed_push_host'] = 'https://rubygems.org/'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport', '>= 5.0'
  spec.add_dependency 'http', '>= 2.2'
  spec.add_dependency 'redis'

  spec.add_development_dependency 'bundler', '>= 1.13'
  spec.add_development_dependency 'minitest', '~> 5.10'
  spec.add_development_dependency 'rake', '~> 10.0'
end
