# == Schema Information
#
# Table name: pages
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  permalink  :string(255)
#  body       :text
#  keywords   :string(255)
#  page_title :string(255)
#  page_body  :text
#  created_at :datetime
#  updated_at :datetime
#

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
