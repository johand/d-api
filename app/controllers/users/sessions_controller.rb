# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    # before_action :configure_sign_in_params, only: [:create]

    # GET /resource/sign_in
    # def new
    #   super
    # end

    # POST /resource/sign_in
    # def create
    #   super
    # end

    # DELETE /resource/sign_out
    # def destroy
    #   super
    # end

    # protected

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_in_params
    #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    # end

    private

    def respond_with(resource, _opts = {})
      render json: { user: resource, status: 200, message: I18n.t('devise.sessions.signed_in') }
    end

    def respond_to_on_destroy
      return log_out_success if current_user
    end

    def log_out_success
      render json: { status: 200, message: I18n.t('devise.sessions.signed_out') }
    end
  end
end
