require 'spec_helper'

describe ApplicationHelper do

  it "javascript should add a js file to yield" do
    helper.javascript("default")
    helper.content_for(:js).should =~ /default\.js/
  end

  it "should set content to title and head when I call the title" do
    object = Post.new(:name => "Post", :keywords => "my, test", :page_body => "desc")
    helper.title(object)
    helper.content_for(:title).should =~ /<h2>Post<\/h2>/
    helper.content_for(:head).should =~ Regexp.new(object.keywords)
    helper.content_for(:head).should =~ Regexp.new(object.page_body)
  end

  it "should return a string when I call the page_title" do
    object = Post.new(:name => "Post", :keywords => "my, test", :page_body => "desc")
    helper.page_title(object).should == "Post - #{AppConfig.site.name}"
  end

  it "should return a formated html when I call the textilize" do
    helper.textilize("**lorem**").should == "<p><strong>lorem</strong></p>\n"
  end

  it "should return a tag when I call the link_to_menu" do
    helper.link_to_menu("test", "/test").should == '<a href="/test" title="test"><span>test</span></a>'
  end

  it "should return links to categories when I call the link_categories" do
    categories = [Category.new(:name => "Test1", :permalink => "test1"), Category.new(:name => "Test2", :permalink => "test2")]
    helper.link_categories(categories).should == '<a href="/categories/test1" rel="tag">Test1</a> e <a href="/categories/test2" rel="tag">Test2</a>'
  end

  it "should return content striped I call the strip_markdown" do
    content = "<table><tr><td><div><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p></div></td></tr></table>"
    helper.strip_markdown(content, 15).should == '<p>Lorem ipsum...</p>'
  end

end
