# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.0'
gem 'bootsnap', '~> 1.10.2', require: false
gem 'bootstrap', '~> 5.1.3'
gem 'devise', '~> 4.8.1'
gem 'devise-bootstrap-views', '~> 1.0'
gem 'ffaker', '~> 2.20'
gem 'hamlit-rails', '~> 0.2.3'
gem 'html2haml', '~> 2.2.0'
gem 'importmap-rails', '~> 1.0.2'
gem 'kaminari', '~> 1.2.2'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.1'
gem 'sassc-rails', '~> 2.1.2'
gem 'sprockets-rails', '~> 3.4.2'
gem 'stimulus-rails', '~> 1.0.2'
gem 'turbo-rails', '~> 1.0.1'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'bundler-audit', '~> 0.9.0.1'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'fasterer', '~> 0.9.0'
  gem 'overcommit'
  gem 'pry-rails', '~> 0.3.9'
  gem 'rubocop', '~> 1.25'
  gem 'rubocop-performance', '~> 1.13.2'
  gem 'rubocop-rails', '~> 2.13.2'
  gem 'rubocop-rspec', '~> 2.8.0'
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'rspec', '~> 3.10'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
