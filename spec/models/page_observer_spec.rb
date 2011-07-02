require 'spec_helper'

describe PageObserver do
  it "should generate the permalink when a page is created" do
    page = Factory.build(:page, :name => "my name")
    obs = PageObserver.instance
    obs.before_save(page)
    page.permalink.should == "my-name"
  end
end
