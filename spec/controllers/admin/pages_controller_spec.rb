require 'spec_helper'

describe Admin::PagesController do

  render_views

  before do
    @object = build(:page)
  end

  should_respond_to_resources except: [ :show ]

end
