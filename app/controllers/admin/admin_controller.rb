class Admin::AdminController < InheritedResources::Base

  protect_from_forgery

  before_filter :check_credentials

  respond_to :html, :xml, :js

  layout "admin"

  def create
    create! do |success, failure|
      success.html { redirect_to(collection_path, notice: t("flash.create.success")) }
    end
  end

  def update
    update! do |success, failure|
      success.html { redirect_to(collection_path, notice: t("flash.update.success")) }
    end
  end

  def destroy
    destroy! do |success, failure|
      success.html { redirect_to(collection_path, notice: t("flash.destroy.success")) }
      failure.html { redirect_to(collection_path, alert: t("flash.destroy.alert")) }
    end
  end

  protected

  def check_credentials
    authenticate_user!
    unless current_user.has_access_to?(:admin)
      flash[:alert] = t("devise.failure.access_denied")
      redirect_to root_path
      return false
    end
  end

end
