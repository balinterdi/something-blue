# see http://wiki.github.com/aslakhellesoy/cucumber/setting-up-selenium for help
require 'spec/expectations'
require 'selenium'
require 'webrat'

Webrat.configure do |config|
  config.mode = :selenium
  # Selenium defaults to using the selenium environment. Use the following to override this.
  config.application_environment = :test
end

require 'database_cleaner'
require 'database_cleaner/cucumber'
DatabaseCleaner.strategy = :truncation