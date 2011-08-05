require 'spec_helper'

describe Admin::RolesController do

  render_views

  before do
    @object = FactoryGirl.build(:role)
  end

  should_respond_to_resources except: [ :show ]

end
