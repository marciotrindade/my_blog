class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :last_update, :admin?

  private

  def admin?
    user_signed_in? && current_user.admin?
  end

  def last_update
    @last_update ||= Post.select(:updated_at).first.try(:updated_at)
  end
end
