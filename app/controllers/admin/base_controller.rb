class Admin::BaseController < ApplicationController

  protect_from_forgery

  before_filter :check_credentials

  respond_to :html, :xml, :js

  protected

  def check_credentials
    authenticate_user!
    unless current_user.admin?
      flash[:alert] = t("devise.failure.access_denied")
      redirect_to root_path
      return false
    end
  end

end
