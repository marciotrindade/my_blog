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

  describe "#menu_tag" do
    let(:expected)  { %Q(<li#{selected_class}><a href="/">#{menu_name}</a></li>) }
    let(:menu_name) { 'Home' }

    context "when controller matches" do
      let(:selected_class) { ' class="ls-active"' }
      let(:name)           { "Home" }
      before { subject.params[:controller] = 'posts' }

      it "returns actived menu_tag" do
        expect(menu_tag(name, root_path, /posts/)).to eq(expected)
      end
    end

    context "when controller does not match" do
      let(:selected_class) { "" }
      let(:name)           { "Home" }
      before { subject.params[:controller] = 'pages' }

      it "returns not actived menu_tag" do
        expect(menu_tag(name, root_path, /lorem/)).to eq(expected)
      end
    end
  end

  describe "#app_pagination" do
    let!(:post1)     { create(:post) }
    let!(:post2)     { create(:post) }
    let(:collection) { Post.page(1).per(1) }
    let(:expected) do
      <<-EOS
        <div class="ls-pagination-filter">
          <ul class="ls-pagination">
            <li class="ls-disabled">
              <a href="/?per=100">« Anterior</a>
            </li>
            <li class="ls-active">
              <a href="/?per=100">1</a>
            </li>
            <li class="">
              <a href="/?page=2&amp;per=100" rel="next">2</a>
            </li>
            <li class="">
              <a href="/?page=2&amp;per=100" rel="next">Próximo »</a>
            </li>
          </ul>
        </div>
      EOS
    end

    before do
      subject.params[:controller] = 'posts'
      subject.params[:action]     = 'index'
      subject.params[:per]        = '100'
    end

    it "returns pagination" do
      pagination = subject.app_pagination(collection)
      pagination.gsub!(/(\n|\t)/, '').gsub!(/(\s{2})/, '')
      expect(pagination).to eq(expected.gsub!(/(\n|\t)/, '').gsub!(/(\s{2})/, ''))
    end
  end

  describe "#flash_message" do
    let(:expected) {
      %Q(<div class="ls-alert-#{alert_class} ls-dismissable">) +
      %Q(<span class="ls-dismiss" data-ls-module="dismiss">×</span>) +
      alert_message +
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

  describe "#sub_menu_tag" do
    let(:expected)  { %Q(<li#{selected_class}><a href="#{path}">#{menu_name}</a></li>) }
    let(:menu_name) { 'Home' }
    let(:path)      { '/pages/test' }

    context "when path is the current page" do
      let(:selected_class) { ' class="ls-active"' }
      let(:name)           { "Home" }
      before do
        allow_any_instance_of(ActionView::Helpers::UrlHelper).to receive(:current_page?).and_return(true)
      end

      it "returns actived menu_tag" do
        expect(sub_menu_tag(name, path)).to eq(expected)
      end
    end

    context "when path is not the current page" do
      let(:selected_class) { "" }
      let(:name)           { "Home" }
      before do
        allow_any_instance_of(ActionView::Helpers::UrlHelper).to receive(:current_page?).and_return(false)
      end

      it "returns not actived menu_tag" do
        expect(sub_menu_tag(name, path)).to eq(expected)
      end
    end
  end

end
