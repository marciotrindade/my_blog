require 'spec_helper'

describe "Contacts" do

  describe "POST /contact" do
    before(:all) do
      create(:page, :name=>"Contato")
    end

    it "should show a error message of validation" do
      visit new_contact_path
      fill_in "contact_name", with: "My Name"
      click_button "Enviar"
      page.should have_content(t('activerecord.errors.messages.blank'))
    end

    it "should show a success when created" do
      visit new_contact_path
      fill_in "contact_name", with: "Marcio Trindade"
      fill_in "contact_email", with: "marciotrindade@gmail.com"
      fill_in "contact_body", with: "Lorem ipsum dolor sit amet."
      click_button "Enviar"

      page.should have_content(t('contact_mailer.send_contact.sucess'))
    end

  end

end
