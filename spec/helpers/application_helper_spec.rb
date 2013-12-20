require 'spec_helper'

describe ApplicationHelper do
  subject { helper }

  describe "#javascript" do
    it "includes javascript_include_tag to content" do
      expect(subject).to receive(:javascript_include_tag).with(:some_js).and_call_original
      expect(subject).to receive(:content_for).with(:js).and_call_original
      subject.javascript(:some_js)
    end
  end

  describe "#title" do
    let(:page) { create(:page, page_title: 'lalatitle', page_body: 'lalabody', keywords: 'lalakeyword') }

    before do
      subject.title(page)
    end

    it "sets content_for title" do
      expect(subject.content_for(:head)).to match(/lalatitle/)
    end
    it "sets content for meta keywords" do
      expect(subject.content_for(:head)).to match(/lalabody/)
    end
    it "sets content for meta description" do
      expect(subject.content_for(:head)).to match(/lalakeyword/)
    end
  end

  describe "#page_title" do
    let(:page) { create(:page, page_title: 'lala') }
    before { subject.instance_variable_set("@page_title", "Title") }

    it "returns title" do
      expect(subject.page_title(page)).to eq(%Q(lala - #{AppConfig.site.name}))
    end
  end

  describe "#textilize" do
    it "returns formated html" do
      expect(subject.textilize("**lorem**")).to eq("<p><strong>lorem</strong></p>\n")
    end
  end

  describe "#strip_markdown" do
    let(:content) { "<table><tr><td><div><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p></div></td></tr></table>" }
    it "returns content striped" do
      expect(subject.strip_markdown(content, 15)).to eq('<p>Lorem ipsum...</p>')
    end
  end

  describe "#link_to_menu" do
    let(:expected)  { %Q(<a #{selected_class} href="/" role="menuitem" title="Home">Home</a>) }

    context "when controller matches with matcher" do
      let(:selected_class) { 'class=" active"' }
      before { subject.params[:controller] = 'posts' }

      it "returns actived link_to_menu" do
        expect(link_to_menu("home", root_path, "posts" )).to eq(expected)
      end
    end

    context "when controller does not match" do
      let(:selected_class) { 'class=""' }
      before { subject.params[:controller] = 'pages' }

      it "returns not actived link_to_menu" do
        expect(link_to_menu("home", root_path, "postrs")).to eq(expected)
      end
    end
  end

  describe "#app_pagination" do
    let!(:post1)     { create(:post) }
    let!(:post2)     { create(:post) }
    let(:collection) { Post.page(1).per(1) }
    let(:expected)   {
      %Q(<div class="txt-center\">)+
      %Q(<ul class="pagination">)+
      %Q(<li class="page active">)+
      %Q(  <a href="/?per=100">1</a>)+
      %Q(</li>)+
      %Q(<li class="page">)+
      %Q(  <a href="/?page=2&amp;per=100" rel="next">2</a>)+
      %Q(</li>)+
      %Q(<li class="next">)+
      %Q(  <a href="/?page=2&amp;per=100" rel="next">#{t('views.pagination.next')}</a>)+
      %Q(</li>)+
      %Q(</ul>)+
      %Q(</div>)
    }
    before do
      subject.params[:controller] = 'posts'
      subject.params[:action]     = 'index'
      subject.params[:per]        = '100'
    end

    it "returns pagination" do
      pagination = subject.app_pagination(collection)
      pagination.gsub!(/(\n|\t)/, '')
      expect(pagination).to eq(expected)
    end
  end

  describe "#flash_message" do
    let(:expected) {
      %Q(<div class="onFocus alert alert-#{alert_class}">)+
      %Q(<a aria-hidden="true" class="close" data-dismiss="alert">x</a>#{alert_message})+
      %Q(</div>)
    }
    before { allow(subject).to receive(:flash).and_return({kind => alert_message}) }

    context "when is an alert" do
      let(:kind)          { 'alert' }
      let(:alert_class)   { t("flash.type.#{kind}") }
      let(:alert_message) { "Please try again" }

      it "returns alert tag" do
        expect(subject.flash_message).to eq(expected)
      end
    end

    context "when is an notice" do
      let(:kind)          { 'notice' }
      let(:alert_class)   { t("flash.type.#{kind}") }
      let(:alert_message) { "created with success" }

      it "returns alert tag" do
        expect(subject.flash_message).to eq(expected)
      end
    end

    context "when is a info" do
      let(:kind)          { 'info' }
      let(:alert_class)   { t("flash.type.#{kind}") }
      let(:alert_message) { "fields is required" }

      it "returns alert tag" do
        expect(subject.flash_message).to eq(expected)
      end
    end

    context "when is a warning" do
      let(:kind)          { 'warning' }
      let(:alert_class)   { t("flash.type.#{kind}") }
      let(:alert_message) { "atention please" }

      it "returns alert tag" do
        expect(subject.flash_message).to eq(expected)
      end
    end
  end

end
