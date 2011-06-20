require 'spec_helper'

describe Admin::ContactsController do

  render_views

  before do
    Admin::ContactsController.any_instance.stubs(:check_credentials)
    @object = Factory(:contact)
  end

  should_respond_to_resources :except => [ :show ]

end
