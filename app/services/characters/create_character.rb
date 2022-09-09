# frozen_string_literal: true

module Characters
  class CreateCharacter < ApplicationService
    attr_reader :character, :user

    Result = ImmutableStruct.new(:success, :character, :user, :error, :message)

    def initialize(params)
      @character = params[:character]
      @user = params[:user]
    end

    def call
      c = Character.new(character)
      c.user_id = user.id

      if c.save
        Result.new(success: true, character:, user:, error: nil,
                   message: 'Character was successfully created.')
      else
        Result.new(success: false, character:, user:, error: c.errors)
      end
    end
  end
end
