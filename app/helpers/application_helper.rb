# frozen_string_literal: true

module ApplicationHelper
  include Rails.application.routes.url_helpers

  def flash_class(level)
    case level
    when 'notice' then "alert alert-info"
    when 'success' then "alert alert-success"
    when 'error' then "alert alert-danger"
    when 'alert' then "alert alert-warning"
    end
  end

  def cancel_link(classes)
    link_to t('cancel_button'), request.env["HTTP_REFERER"],
            class: classes,
            confirm: t('confirm_canceling')
  end
end
