require 'spec_helper'

describe Admin::UsersController do

  include Devise::TestHelpers

  render_views

  it "should permit to access the admin when have credentials" do
    controller.stub(:check_credentials).and_return(true)
    get :index

    response.should be_success
    mime_should_eq(:html)
  end

  it "should not permit to access the admin when not logged in" do
    get :index

    flash[:alert].should == I18n.t("devise.failure.unauthenticated")
    response.should redirect_to(new_user_session_path)
  end

  it "should not permit to access the admin when logged but don't have credentials" do
    @user = create(:user)
    controller.stub(:current_user).and_return(@user)
    controller.stub(:authenticate_user!).and_return(true)

    get :index

    flash[:alert].should == I18n.t("devise.failure.access_denied")
    response.should redirect_to(root_path)
  end

end
