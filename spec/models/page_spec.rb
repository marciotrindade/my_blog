require 'spec_helper'

describe Page do

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:keywords) }
    it { should validate_presence_of(:page_title) }
    it { should validate_presence_of(:page_body) }

    context "uniqueness" do
      before { create(:page, permalink: "test") }
      it { should validate_uniqueness_of(:permalink) }
      it { should validate_uniqueness_of(:page_title) }
    end
  end
end
