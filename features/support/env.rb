require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'capybara/rspec'
require 'cucumber'
require 'rspec'
require 'site_prism'
require 'selenium-webdriver'
require 'byebug'
require 'pry'
require 'pry-byebug'
require 'report_builder'
require 'webdrivers'

browser_name = ENV['BROWSER'] || "chrome"

# Configure Capybara with defaults
Capybara.configure do |config|
  config.default_driver = :selenium
end

# Register Firefox
Capybara.register_driver :selenium do |app|
  options = {
      :js_errors => false,
  }
  Capybara::Selenium::Driver.new(app, :browser => :firefox)
end

# Register Chrome
Capybara.register_driver :selenium_chrome do |app|
  Selenium::WebDriver::Chrome::Service.driver_path = "C:/ProgramData/chocolatey/lib/chromedriver/tools/chromedriver.exe"
  Capybara::Selenium::Driver.new(app, 
    :url => "http://localhost:9515/",
    :browser => :chrome)
end

# Choose a driver to use
case browser_name.upcase
  when 'CHROME'
    Capybara.default_driver = :selenium_chrome
  when 'FF', 'FIREFOX'
     Capybara.default_driver = :selenium
  else
    raise("Browser '#{browser_name}' is not supported. Use Firefox, Chrome or Headless")
end
