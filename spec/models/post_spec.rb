# == Schema Information
#
# Table name: posts
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  permalink      :string(255)
#  summary        :text
#  body           :text
#  comments_count :integer          default(0)
#  keywords       :string(255)
#  page_body      :text
#  created_at     :datetime
#  updated_at     :datetime
#  active         :boolean          default(FALSE)
#

require 'spec_helper'

describe Post do

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:keywords) }
    it { should validate_presence_of(:page_body) }
    context "uniqueness" do
      before { create(:post, permalink: "test") }
      it { should validate_uniqueness_of(:permalink) }
    end
  end

  describe "assosiations" do
    it { should have_many(:categories_posts) }
    it { should have_many(:categories).through(:categories_posts) }
  end

  describe "scopes" do
    it "default order by created_at" do
      expect(Post.all.to_sql).to match(/ORDER BY created_at DESC/)
    end

    it ".active" do
      expect(Post.active.where_values_hash).to eq("active" => true)
    end
  end

  describe "with a instance" do
    subject { create(:post, summary: nil, active: true) }

    it "#year path" do
      expect(subject.year_path).to eq("/#{Date.today.year}")
    end

    it "#month path" do
      expect(subject.month_path).to eq("/#{Date.today.year}/#{Date.today.month}")
    end

    it "#day path" do
      expect(subject.day_path).to eq("/#{Date.today.year}/#{Date.today.month}/#{Date.today.day}")
    end

    it "#path" do
      expect(subject.path).to eq("/#{Date.today.year}/#{Date.today.month}/#{Date.today.day}/#{subject.permalink}")
    end

    it "#summary" do
      expect(subject.summary).to eq(subject.body)
    end

    it "#page_title" do
      expect(subject.page_title).to eq(subject.name)
    end
  end

  describe ".by_date" do
    let(:today) { Date.today }

    context "with year" do
      let(:expected) { Post.where("created_at BETWEEN ? AND ?", *Post.time_interval(today.year)).to_sql }
      it "returns sql" do
        expect(Post.by_date(today.year).to_sql).to eq(expected)
      end
    end

    context "with year and month" do
      let(:expected) { Post.where("created_at BETWEEN ? AND ?", *Post.time_interval(today.year, today.month)).to_sql }
      it "returns sql" do
        expect(Post.by_date(today.year, today.month).to_sql).to eq(expected)
      end
    end

    context "with year, month and day" do
      let(:expected) { Post.where("created_at BETWEEN ? AND ?", *Post.time_interval(today.year, today.month, today.day)).to_sql }
      it "returns sql" do
        expect(Post.by_date(today.year, today.month, today.day).to_sql).to eq(expected)
      end
    end
  end

  describe ".time_interval" do
    let(:d) { Date.today }

    it "with year" do
      expect(Post.time_interval(d.year)).to eq([d.to_time.beginning_of_year, d.to_time.end_of_year])
    end

    it "with year and month" do
      expect(Post.time_interval(d.year, d.month)).to eq([d.to_time.beginning_of_month, d.to_time.end_of_month])
    end

    it "with year, month and day" do
      expect(Post.time_interval(d.year, d.month, d.day)).to eq([d.to_time.beginning_of_day, d.to_time.end_of_day])
    end
  end

  describe ".archive" do
    let!(:post1) { create(:post, created_at: Date.new(2013, 12, 1)) }
    let!(:post2) { create(:post, created_at: Date.new(2013, 12, 10)) }
    let!(:post3) { create(:post, created_at: Date.new(2013, 11, 1)) }

    it "returns 3 objects" do
      expect(Post.archive.to_a.size).to eql(2)
    end

    it "returns grouped total" do
      expect(Post.archive.first.total).to eq(2)
      expect(Post.archive.last.total).to eq(1)
    end
  end

end
