source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.4'

gem 'rails', '~> 6.0.2'
gem "pg", ">= 0.18", "< 2.0"
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'config'
gem 'bootstrap', '~> 4.4.1'
gem 'slim-rails'
gem 'kaminari'
gem 'bootstrap4-kaminari-views'
gem 'simple_form'

group :development, :test do
  gem "factory_bot_rails"
  gem "pry-rails"
  gem "rails-controller-testing"
  gem "rspec-rails", "~> 4.0.0.beta"
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'shoulda-matchers'
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data'
