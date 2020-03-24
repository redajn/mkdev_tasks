# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.4"

gem "bootsnap", ">= 1.4.2", require: false
gem "bootstrap", "~> 4.4.1"
gem "bootstrap4-kaminari-views"
gem "config"
gem "jbuilder", "~> 2.7"
gem "kaminari"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 4.1"
gem "rails", "~> 6.0.2"
gem "sass-rails", ">= 6"
gem "simple_form"
gem "slim-rails"
gem "turbolinks", "~> 5"
gem "webpacker", "~> 4.0"
gem 'show_for'

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "factory_bot_rails"
  gem "pry-rails"
  gem "rails-controller-testing"
  gem "rspec-rails", "~> 4.0.0.beta"
  gem "rubocop"
  gem "rubocop-performance"
  gem "rubocop-rails"
  gem "faker", git: "https://github.com/faker-ruby/faker.git", branch: "master"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  gem "shoulda-matchers"
  gem "webdrivers"
end

gem "tzinfo-data"
