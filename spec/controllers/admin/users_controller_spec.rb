require 'spec_helper'

describe Admin::UsersController do

  render_views

  before do
    Admin::UsersController.any_instance.stubs(:check_credentials)
    @object = Factory(:user)
  end

  should_respond_to_resources except: [ :show ]

end
