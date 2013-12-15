class ApplicationDecorator < Draper::Decorator
  delegate_all

  def routes
    Rails.application.routes.url_helpers
  end

end
