module ControllersMacros

  def mock_permission
    before do
      allow(controller).to receive(:current_user).and_return(build(:user))
      allow(controller).to receive(:check_credentials)
    end
  end

end
