require 'spec_helper'

describe Admin::ContactsController do

  render_views

  before do
    @object = build(:contact)
  end

  should_respond_to_resources except: [ :show ]

end
