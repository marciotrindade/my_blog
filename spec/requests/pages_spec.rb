require 'spec_helper'

describe "Pages" do

  it "display about us content" do
    visit pages_path('about-us')
    page.should have_content('test')
  end

end
