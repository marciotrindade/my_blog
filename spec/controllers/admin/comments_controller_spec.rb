require 'spec_helper'

describe Admin::CommentsController do

  render_views

  before do
    @object = FactoryGirl.build(:comment)
  end

  should_respond_to_resources except: [ :show ]

end
