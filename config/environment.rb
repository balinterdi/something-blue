# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.2' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.

  # Add additional load paths for your own custom dirs
  config.load_paths += %W( #{RAILS_ROOT}/app/patches )

  config.gem "paulcarey-relaxdb", :lib => "relaxdb", :source => "http://gems.github.com"
  config.gem "haml", :version => ">= 2.0.9"
  config.gem "rspec", :version => ">= 1.2.6", :lib => 'spec'
  # rspec-rails forces test environment if properly required here (see also test.rb)
  config.gem "rspec-rails", :version => ">= 1.2.6", :lib => false
  config.gem "cucumber", :version => ">= 0.3.9", :source => "http://gems.github.com"
  config.gem "thoughtbot-factory_girl", :version => ">= 1.1.5", :lib => "factory_girl", :source => "http://gems.github.com"
  config.gem "webrat", :version => ">= 0.4.3"
  config.gem "Selenium", :version => ">= 1.1.14", :lib => 'selenium'
  config.gem "selenium-client", :version => ">= 1.2.14", :lib => 'selenium'

  # config.gem "authlogic"

  # Skip frameworks you're not going to use. To use Rails without a database,
  # you must remove the Active Record framework.
  config.frameworks -= [ :active_record, :active_resource, :action_mailer ]
  config.time_zone = 'UTC'
end

puts "XXX RAILS_ENV: #{RAILS_ENV}"
require 'relaxdb'
RelaxDB.configure :host => "localhost", :port => 5984, :design_doc => 'something_blue'
RelaxDB.use_db "something_blue_#{RAILS_ENV}"
RelaxDB.enable_view_creation