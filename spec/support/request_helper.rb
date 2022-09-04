# frozen_string_literal: true

module RequestHelper
  def login_user
    before(:each) do
      @user = create(:user)
      sign_in @user
    end
  end
end
