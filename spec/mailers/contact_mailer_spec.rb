require "spec_helper"

describe ContactMailer do
  describe "send_contact" do
    before do
      @contact = Factory(:contact)
    end
    let(:mail) { ContactMailer.send_contact(@contact) }

    it "renders the headers" do
      mail.subject.should == "[marciotrindade.com] Contato"
      mail.to.should == ["marciotrindade@gmail.com"]
      mail.from.should == [@contact.email]
    end

    it "renders the body" do
      mail.body.encoded.should match(@contact.name)
    end
  end

end
