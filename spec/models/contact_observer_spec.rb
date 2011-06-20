require 'spec_helper'

describe ContactObserver do
  it "should send email when contact is created" do
    @contact = Factory(:contact)
    @obs = ContactObserver.instance
    NilClass.any_instance.stubs(:deliver)
    ContactMailer.expects(:send_contact).with(@contact)
    @obs.after_create(@contact)
  end
end
