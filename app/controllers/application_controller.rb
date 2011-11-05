class ApplicationController < ActionController::Base

  protect_from_forgery

  expose(:categories) { Category.scoped }
  expose(:dates) { Post.active.dates }

  helper_method :breadcrumbs

  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception,                            with: :render_error
    rescue_from ActiveRecord::RecordNotFound,         with: :render_not_found
    rescue_from ActionController::RoutingError,       with: :render_not_found
    rescue_from ActionController::UnknownController,  with: :render_not_found
    rescue_from ActionController::UnknownAction,      with: :render_not_found
  end

  private

  def render_not_found(exception)
    render template: "/errors/404", status: 404
  end

  def render_error(exception)
    render template: "/errors/500", status: 500
  end

end
