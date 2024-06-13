# frozen_string_literal: true

require_relative 'lib/mysql2/iamauth/version'

Gem::Specification.new do |spec|
  spec.name          = 'mysql2-iamauth'
  spec.version       = Mysql2::Iamauth::VERSION
  spec.authors       = ['Degica']
  spec.email         = ['dev@degica.com']

  spec.summary       = 'Mysql2-iamauth summary'
  spec.description   = 'Mysql2-iamauth description'
  spec.homepage      = 'https://github.com/degica/mysql2-iamauth'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.7.0')

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/degica/mysql2-iamauth'
  spec.metadata['changelog_uri'] = 'https://github.com/degica/mysql2-iamauth'

  spec.files         = Dir['{exe,data,lib}/**/*'] + %w[Gemfile mysql2-iamauth.gemspec]
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'aws-sdk-rds'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
end
