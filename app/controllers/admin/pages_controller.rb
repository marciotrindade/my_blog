class Admin::PagesController < Admin::BaseController

  actions :all, except: :show

  def home
  end

end
