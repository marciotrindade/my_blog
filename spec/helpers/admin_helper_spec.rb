require 'spec_helper'

describe AdminHelper do

  it "should call the javascript data_table function when I call the data_table" do
    helper.data_table
    helper.content_for(:js).should =~ /text\/javascript/
    helper.content_for(:js).should =~ /dataTable/
    helper.content_for(:js).should =~ /sPaginationType/
    helper.content_for(:js).should =~ /bStateSave/
    helper.content_for(:js).should =~ /bInfo/
    helper.content_for(:js).should =~ /iDisplayLength/
    helper.content_for(:js).should =~ /aaSorting/
  end

  it "should add has content for title when i call the admin_title" do
    helper.admin_title("test")
    helper.content_for(:title).should == "test"
  end

  it "should return a formated string when I call the admin_page_title" do
    helper.stubs(:breadcrumbs).returns([["test", :root_path]])
    helper.admin_page_title.should == "test - #{AppConfig.site.name}"
  end

end
