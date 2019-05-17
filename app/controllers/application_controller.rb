# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper

  before_action :set_locale

  private

  def set_locale
    I18n.locale = extract_locale || params[:locale] || I18n.default_locale
  end

  def extract_locale
    tld = request.host.split(".").last
    I18n.available_locales.map(&:to_s).include?(tld) ? tld : nil
  end
end
