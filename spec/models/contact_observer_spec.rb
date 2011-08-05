require 'spec_helper'

describe ContactObserver do
  it "should send email when contact is created" do
    @contact = FactoryGirl.build(:contact)
    @obs = ContactObserver.instance
    @mailer = Object.new
    @mailer.stub(:deliver)
    ContactMailer.should_receive(:send_contact).with(@contact).and_return(@mailer)
    @obs.after_create(@contact)
  end
end
