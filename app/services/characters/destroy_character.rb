# frozen_string_literal: true

module Characters
  class DestroyCharacter < ApplicationService
    attr_reader :character

    Result = ImmutableStruct.new(:success, :character, :message)

    def initialize(params)
      @character = params[:character]
    end

    def call
      Result.new(success: true, character:, message: 'Character deleted') if character.destroy
    end
  end
end
