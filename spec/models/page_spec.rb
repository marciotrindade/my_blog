require 'spec_helper'

describe Page do

  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:keywords) }
    it { should validate_presence_of(:page_title) }
    it { should validate_presence_of(:page_body) }
  end

  context "with an instance" do
    before(:each) do
      @page = create(:page, permalink: "test")
    end
    it { should validate_uniqueness_of(:permalink) }
    it { should validate_uniqueness_of(:page_title) }
  end

end
