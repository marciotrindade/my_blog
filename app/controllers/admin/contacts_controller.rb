class Admin::ContactsController < Admin::BaseController

  add_breadcrumb :contact, "collection_path"
  add_breadcrumb :create, '', only: [:new, :create]
  add_breadcrumb :edit, '', only: [:edit, :update]
  add_breadcrumb :show, '', only: [:show]

  actions :all, except: :show

end
