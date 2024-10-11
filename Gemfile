source "https://rubygems.org"


gem "bootsnap", require: false
gem "cssbundling-rails"
gem "bootstrap", "~> 5.3.3"

gem "jbuilder"
gem "jsbundling-rails"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "rails", "~> 7.2.1"
gem "redis","~> 4.0"
gem "sassc-rails"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"
gem "importmap-rails"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]


group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "devise"
  gem "shoulda-matchers", "~> 3.1"
  gem "factory_bot_rails"
  gem "faker", git:"https://github.com/faker-ruby/faker.git",branch: "main"
  gem "pry-rails"
  gem 'rspec-rails'
  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "brakeman", require: false

  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
  gem "timecop"
end

