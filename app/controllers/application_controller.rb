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

  # Internal: Add info to lograge's payload.
  #
  # payload - A Hash that contains some informations to log.
  #
  # Returns nothing.
  def append_info_to_payload(payload)
    super
    payload[:remote_ip] = request.remote_ip
  end
end
