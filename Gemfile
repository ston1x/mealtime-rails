source 'https://rubygems.org'

ruby '3.2.2'

gem 'bootsnap', require: false
gem 'pg', '~> 1.1'
gem 'puma', '>= 5.0'
gem 'rack-cors'
gem 'rails', '~> 7.1.3'
gem 'rubocop', '~> 1.60'
gem 'tzinfo-data', platforms: %i[windows jruby]

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri windows]
  gem 'dotenv'
  gem 'factory_bot_rails'
  gem 'pry'
  gem 'rspec-rails', '~> 6.1.0'
end

group :test do
  gem 'shoulda-matchers', '~> 6.0'
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

gem "dockerfile-rails", ">= 1.6", :group => :development
