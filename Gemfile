source 'https://rubygems.org'

# Specify your gem's dependencies in hello_sign.gemspec
gemspec

group :development, :spec do
  gem 'pry'
  gem 'growl' if `uname` =~ /Darwin/
  gem 'guard'
  gem 'guard-bundler'
  gem 'guard-rspec'
  gem 'coveralls', :require => false
end
