class Admin::CategoriesController < Admin::BaseController

  actions :all, except: :show

end