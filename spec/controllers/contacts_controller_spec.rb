require 'spec_helper'

describe ContactsController do

  render_views

  before(:each) do
    controller.stub(:user_signed_in?).and_return(false)
    @page = FactoryGirl.build(:page, :name=>"Contato")
    Page.stub(:find_by_permalink).and_return(@page)
  end

  describe "visit index" do
    it "should respond to html" do
      get :new
      response.should be_success
      response.should render_template(:new)
    end
  end

  describe "create new" do
    it "should respond with success" do
      Contact.any_instance.stub(:save).and_return(true)
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
