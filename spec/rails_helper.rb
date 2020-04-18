# frozen_string_literal: true

require 'spec_helper'
require 'capybara/rspec'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'
require 'capybara/rails'

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Warden::Test::Helpers
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

Capybara.register_driver :headless_chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: { args: %w[no-sandbox headless disable-gpu] }
  )

  Capybara::Selenium::Driver.new app,
                                 browser:              :chrome,
                                 desired_capabilities: capabilities
end

Capybara.default_driver = :headless_chrome
