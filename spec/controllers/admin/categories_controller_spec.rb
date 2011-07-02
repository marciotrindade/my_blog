require 'spec_helper'

describe Admin::CategoriesController do

  render_views

  before do
    Admin::CategoriesController.any_instance.stubs(:check_credentials)
    @object = Factory(:category)
  end

  should_respond_to_resources except: [ :show ]

end
