# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.3"

# Bundle edge Rails instead: gem "rails", github: "rails/rails"
gem "rails", "~> 5.2.2", ">= 5.2.2.1"
gem "pg"
gem "puma", "~> 3.11"
gem "webpacker"
gem "turbolinks", "~> 5"
gem "hamlit"
gem "hamlit-rails"
gem "jb"
gem "bootsnap", ">= 1.1.0", require: false
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem "aasm"
gem "pundit"
gem "decent_exposure"
gem "validate_url"
gem "bcrypt"
gem "sentry-raven"

group :development, :test do
  gem "pry"
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "pry-byebug"
  gem "pry-rails"
  gem "awesome_print"
  # gem "factory_bot"
  # gem "factory_bot_rails"
  gem "rspec-rails"
  gem "shoulda-matchers"
  gem "bullet"
  gem "database_cleaner"
end

group :development do
  gem "erb2haml"
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "better_errors"
  gem "binding_of_caller"
  gem "letter_opener"
  gem "overcommit"
  gem "bundler-audit"
  gem "fasterer"
  gem "rubocop", require: false
  gem "brakeman", require: false
  gem "rails_best_practices"
  gem "rails-erd"
  gem "active_record_query_trace"
  gem "i18n-tasks", "~> 0.9.29"
end

group :test do
  gem "simplecov"
end
