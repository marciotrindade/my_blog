module ControllersMacros

  def mock_permission
    before do
      allow(controller).to receive(:check_credentials)
    end
  end

end
