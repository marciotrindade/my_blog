require 'spec_helper'

describe ApplicationHelper do

  it "javascript should add a js file to yield" do
    ENV['RAILS_ASSET_ID'] = '1'
    helper.javascript("default")
    helper.content_for(:js).should == "<script src=\"/assets/default.js\" type=\"text/javascript\"></script>"
  end

  it "page_title should respond with a title to page" do
    helper.page_title.should == AppConfig.site.name
  end

  it "page_title should respond with a title to page" do
    helper.stubs(:breadcrumbs).returns([["test", :root_path]])
    helper.page_title.should == AppConfig.site.name
  end

end
