require 'spec_helper'

describe Admin::PostsController do

  render_views

  before do
    Admin::PostsController.any_instance.stubs(:check_credentials)
    @object = Factory(:post)
  end

  should_respond_to_resources :except => [ :show ]

end
