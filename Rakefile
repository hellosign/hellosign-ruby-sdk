require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new

task :default => :spec
task :test => :spec

task :console do
  require 'irb'
  require 'irb/completion'
  require 'hello_sign' # You know what to do.
  @client = HelloSign::Client.new :email_address => 'testuser@example.com', :password => '12345678', :client_id => '7f91612ee160dd56bd899cd1688bbefc', :client_secret => 'a403773af1e1aee206976257a47249cf'
  ARGV.clear
  IRB.start
end
