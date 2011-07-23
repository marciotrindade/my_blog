require 'spec_helper'

describe ContactsController do

  render_views

  describe "visit index" do
    before(:all) do
      Factory(:page, :name=>"Contato")
    end
    it "should respond to html" do
      get :new
      response.should be_success
      response.should render_template(:new)
    end
  end

  describe "create new" do
    it "should respond with success" do
      Contact.any_instance.stubs(:save).returns(true)
      Contact.any_instance.stubs(:errors).returns("")
      post :create, { name: "advertise" }

      flash[:notice].should == t('contact_mailer.send_contact.sucess')
      response.should redirect_to(new_contact_path)
    end

    it "should respond with fail" do
      post :create, { name: "contact" }

      response.should be_success
      response.should render_template(:new)
    end
  end

end
