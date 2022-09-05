# frozen_string_literal: true

module Characters
  class UpdateCharacter < ApplicationService
    attr_reader :character, :character_params

    Result = ImmutableStruct.new(:success, :character, :error, :message)

    def initialize(params)
      @character = params[:character]
      @character_params = params[:character_params]
    end

    def call
      if character.update(character_params)
        Result.new(success: true, character:, error: nil,
                   message: 'Character was successfully updated.')
      else
        Result.new(success: false, character:, error: character.errors)
      end
    end
  end
end
