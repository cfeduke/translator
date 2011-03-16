ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'selenium-webdriver'
Selenium::WebDriver.for :firefox
Capybara.default_driver = :selenium

Rails.backtrace_cleaner.remove_silencers!
Translator.reload!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  
  #removed by instruction
  #fixtures :all

  self.use_transactional_fixtures = false
end
