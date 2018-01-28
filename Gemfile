source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.4'
gem 'mysql2'
gem 'puma', '~> 3.7'
gem 'figaro'
gem 'sass-rails'
gem 'uglifier'
gem 'simple_form'
gem 'select2-rails'
gem 'ransack'
gem 'coffee-rails'
gem 'turbolinks'
gem 'jbuilder'
gem 'bootstrap'
gem 'font-awesome-sass'
gem 'font-awesome-rails'
gem 'jquery-rails'
gem 'bootstrap-datepicker-rails'
gem 'devise'
gem 'devise-jwt'
gem 'paperclip'
gem 'rails_admin'
gem 'cancancan'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'database_cleaner'
  gem 'timecop'
  gem 'letter_opener'
  gem 'better_errors'
  gem 'capybara'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'simplecov', require: false, group: :test