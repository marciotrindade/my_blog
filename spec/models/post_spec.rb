require 'spec_helper'

describe Post do

  context "validations" do
    subject { create(:post, permalink: "test") }
    it { should validate_uniqueness_of(:permalink) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:keywords) }
    it { should validate_presence_of(:page_body) }
  end

  context "assosiations" do
    it { should have_and_belong_to_many(:categories) }
    it { should have_many(:comments) }
  end

  it "default scope order by name" do
    post_one = create(:post, created_at: Date.today - 1.day)
    post_two = create(:post, created_at: Date.today)

    Post.first.should == post_two
    Post.last.should == post_one
  end

  context "self methods" do
    it "should respond to active" do
      Post.active.should == Post.where(active: true)
    end

    it "should respond to recent" do
      Post.recent.should == Post.limit(10)
    end

    it "should respond to dates" do
      Post.dates.should == Post.select("created_at").group("YEAR(created_at), MONTH(created_at)")
    end
    
    it "should respond to by_date with year" do
      Post.by_date(Date.today.year).should == Post.where("created_at BETWEEN ? AND ?", *Post.time_interval(Date.today.year))
    end

    it "should respond to by_date with year and month" do
      d = Date.today
      Post.by_date(d.year, d.month).should == Post.where("created_at BETWEEN ? AND ?", *Post.time_interval(d.year, d.month))
    end

    it "should respond to by_date with year, month and day" do
      d = Date.today
      Post.by_date(d.year, d.month, d.day).should == Post.where("created_at BETWEEN ? AND ?", *Post.time_interval(d.year, d.month, d.day))
    end
    
    it "should respond to time_interval with year" do
      d = Date.today
      Post.time_interval(d.year).should == [d.to_time.beginning_of_year, d.to_time.end_of_year]
    end

    it "should respond to time_interval with year and month" do
      d = Date.today
      Post.time_interval(d.year, d.month).should == [d.to_time.beginning_of_month, d.to_time.end_of_month]
    end

    it "should respond to time_interval with year, month and day" do
      d = Date.today
      Post.time_interval(d.year, d.month, d.day).should == [d.to_time.beginning_of_day, d.to_time.end_of_day]
    end
  end

  context "with a instance" do
    before(:all) do
      @post = create(:post, summary: nil, active: true)
    end

    it "should has year path" do
      @post.year_path.should == "/#{Date.today.year}"
    end

    it "should has month path" do
      @post.month_path.should == "/#{Date.today.year}/#{Date.today.month}"
    end

    it "should has day path" do
      @post.day_path.should == "/#{Date.today.year}/#{Date.today.month}/#{Date.today.day}"
    end

    it "should has path" do
      @post.path.should == "/#{Date.today.year}/#{Date.today.month}/#{Date.today.day}/#{@post.permalink}"
    end

    it "should use body when summary is nil" do
      @post.summary.should == @post.body
    end
    
    it "should return total of posts in the same month" do
      @post.total_in_month.should == 1
      create(:post, active: true)
      @post.total_in_month.should == 2
      create(:post, active: false)
      @post.total_in_month.should == 2
      create(:post, created_at: Date.today - 1.month, active: true)
      @post.total_in_month.should == 2
    end
  end

end
