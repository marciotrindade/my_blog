require 'spec_helper'

describe Admin::PagesController do

  include Devise::TestHelpers

  render_views

  describe "check_credentials" do
    context "when has credentials" do
      before do
        allow(controller).to receive(:current_user).and_return(build(:user))
        allow(controller).to receive(:check_credentials)
        get :index
      end

      it { should respond_with(:success) }
    end

    context "when is not logged in" do
      before do
        get :index
      end

      it { should set_the_flash[:alert].to(I18n.t("devise.failure.unauthenticated")) }
      it { should redirect_to(new_user_session_path) }
    end

    context "when is logged, but isn't an admin" do
      let(:user) { create(:user) }
      before do
        allow(controller).to receive(:current_user).and_return(user)
        allow(controller).to receive(:authenticate_user!)
        get :index
      end

      it { should set_the_flash[:alert].to(I18n.t("devise.failure.access_denied")) }
      it { should redirect_to(root_path) }
    end
  end

end
