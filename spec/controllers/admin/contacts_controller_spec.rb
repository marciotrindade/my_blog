require 'spec_helper'

describe Admin::ContactsController do

  render_views

  before do
    @object = FactoryGirl.build(:contact)
  end

  should_respond_to_resources except: [ :show ]

end
