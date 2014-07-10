require "spec_helper"

describe ContactMailer do
  describe "send_contact" do
    let(:contact) { create(:contact) }
    let(:mail)    { ContactMailer.send_contact(contact) }

    it "renders the headers" do
      expect(mail.subject).to eql("[marciotrindade.com] Contato")
      expect(mail.to).to      eql(["marciotrindade@gmail.com"])
      expect(mail.from).to    eql([contact.email])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match(contact.name)
    end
  end

end
