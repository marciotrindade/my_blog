require 'spec_helper'

describe Admin::CommentsController do

  render_views

  before do
    Admin::CommentsController.any_instance.stubs(:check_credentials)
    @object = Factory(:comment)
  end

  should_respond_to_resources except: [ :show ]

end
