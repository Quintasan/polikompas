# frozen_string_literal: true

if ENV["RAILS_ENV"].eql?("test")
  require "simplecov"
  SimpleCov.start "rails"
end
