class Admin::PagesController < Admin::BaseController

  add_breadcrumb :page, "collection_path", except: :home
  add_breadcrumb :create, '', only: [:new, :create]
  add_breadcrumb :edit, '', only: [:edit, :update]
  add_breadcrumb :show, '', only: [:show]

  actions :all, except: :show

  def home
  end

end
