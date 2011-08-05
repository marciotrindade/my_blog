require 'spec_helper'

describe Admin::PostsController do

  render_views

  before do
    @object = FactoryGirl.build(:post)
  end

  should_respond_to_resources except: [ :show ]

end
