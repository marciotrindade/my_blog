class Admin::ContactsController < Admin::BaseController

  actions :all, except: :show

end
