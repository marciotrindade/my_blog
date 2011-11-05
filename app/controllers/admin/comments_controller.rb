class Admin::CommentsController < Admin::BaseController

  actions :all, except: :show

end