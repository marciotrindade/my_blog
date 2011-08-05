require 'spec_helper'

describe Admin::UsersController do

  render_views

  before do
    @object = FactoryGirl.build(:user)
  end

  should_respond_to_resources except: [ :show ]

end
