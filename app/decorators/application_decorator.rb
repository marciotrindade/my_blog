class ApplicationDecorator < Draper::Decorator
  delegate_all

  def t(name, opts={})
    I18n.t(name, opts)
  end

  def l(time, format = :api)
    I18n.l(time, format: format)
  end

  def routes
    Rails.application.routes.url_helpers
  end

end
