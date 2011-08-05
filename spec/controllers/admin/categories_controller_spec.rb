require 'spec_helper'

describe Admin::CategoriesController do

  render_views

  before do
    @object = FactoryGirl.build(:category)
  end

  should_respond_to_resources except: [ :show ]

end
