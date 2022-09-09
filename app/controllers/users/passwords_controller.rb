# frozen_string_literal: true

module Users
  class PasswordsController < Devise::PasswordsController
    # GET /resource/password/new
    # def new
    #   super
    # end

    # POST /resource/password
    def create
      self.resource = resource_class.send_reset_password_instructions(resource_params)

      if successfully_sent?(resource)
        message = I18n.t('devise.passwords.send_instructions')
        render json: { message:, status: 200 }
      else
        render json: { status: :unprocessable_entity, errors: resource.errors }
      end
    end

    # GET /resource/password/edit?reset_password_token=abcdef
    # def edit
    #   super
    # end

    # PUT /resource/password
    def update
      self.resource = resource_class.reset_password_by_token(resource_params)
      yield resource if block_given?
      updated = I18n.t('devise.passwords.updated')
      updated_not_active = I18n.t('devise.passwords.updated_not_active')

      if resource.errors.empty?
        resource.unlock_access! if unlockable?(resource)
        if Devise.sign_in_after_reset_password
          flash_message = resource.active_for_authentication? ? updated : updated_not_active
          render json: { status: 200, message: flash_message, user: resource }
          resource.after_database_authentication
          sign_in(resource_name, resource)
        else
          render json: { status: 200, message: updated_not_active, user: resource }
        end

        def respond_with(resource, _opts = {})
          render json: { status: 200, message: resource }
        end
      else
        render json: { status: :unprocessable_entity, errors: resource.errors }
      end
    end

    # protected

    # def after_resetting_password_path_for(resource)
    #   super(resource)
    # end

    # The path used after sending reset password instructions
    # def after_sending_reset_password_instructions_path_for(resource_name)
    #   super(resource_name)
    # end
  end
end
