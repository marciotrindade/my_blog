class Admin::RolesController < Admin::BaseController

  actions :all, except: :show

end