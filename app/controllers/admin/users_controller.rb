class Admin::UsersController < Admin::BaseController

  actions :all, except: :show

end
