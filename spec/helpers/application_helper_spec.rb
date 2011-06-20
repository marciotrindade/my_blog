require 'spec_helper'

describe ApplicationHelper do

  it "javascript should add a js file to yield" do
    ENV['RAILS_ASSET_ID'] = '1'
    helper.javascript("default")
    helper.content_for(:js).should == "<script src=\"/assets/default.js\" type=\"text/javascript\"></script>"
  end

  it "title should add a string title to yield" do
    helper.title("test")
    helper.content_for(:title).should == "test"
  end

  it "page_title should respond with a title to page" do
    helper.page_title.should == AppConfig.site.name
  end

  it "page_title should respond with a title to page" do
    helper.stubs(:breadcrumbs).returns([["test", :root_path]])
    helper.breadcrumb.should == "<a href=\"/\">Home</a> &gt; <a href=\"/\">test</a>"
  end

  it "show_attribute respond with espefic content" do
    helper.show_attribute(:born, 18).should == "<dd>Idade: <span>18 </span></dd>".html_safe
  end

end
