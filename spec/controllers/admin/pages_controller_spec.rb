require 'spec_helper'

describe Admin::PagesController do

  render_views

  before do
    Admin::PagesController.any_instance.stubs(:check_credentials)
    @object = Factory(:page)
  end

  should_respond_to_resources except: [ :show ]

end
