class Admin::AdminController < InheritedResources::Base

  protect_from_forgery

  before_filter :check_credentials

  respond_to :html, :xml, :js

  layout "admin"

  def index
    index! do |format|
      format.html { render_or_default(:index) }
    end
  end

  def new
    new! do |format|
      format.html { render_or_default(:new) }
    end
  end

  def create
    create! do |success, failure|
      success.html do
        redirect_to(collection_path, notice: t("flash.create.success"))
      end
      success.xml { render xml: resource }
      failure.html do
        render_or_default(:new)
      end
    end
  end

  def edit
    edit! do |format|
      format.html { render_or_default(:edit) }
    end
  end

  def update
    update! do |success, failure|
      success.html do
        redirect_to(collection_path, notice: t("flash.update.success"))
      end
      failure.html do
        render_or_default(:edit)
      end
    end
  end

  def destroy
    destroy! do |success, failure|
      success.html do
        redirect_to(collection_path, notice: t("flash.destroy.success"))
      end
      failure.html do
        redirect_to(collection_path, alert: t("flash.destroy.alert"))
      end
    end
  end

  protected

  def render_or_default(name, args = {})
    render name, args
  rescue ActionView::MissingTemplate
    render args.merge(template: "../scaffolds/#{name}", prefix: '')
  end

  def check_credentials
    authenticate_user!
    unless current_user.has_access_to?(:admin)
      flash[:alert] = t("devise.failure.access_denied")
      redirect_to root_path
      return false
    end
  end

end
