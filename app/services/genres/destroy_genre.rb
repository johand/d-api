# frozen_string_literal: true

module Genres
  class DestroyGenre < ApplicationService
    attr_reader :genre

    Result = ImmutableStruct.new(:success, :genre, :message)

    def initialize(params)
      @genre = params[:genre]
    end

    def call
      Result.new(success: true, genre:, message: 'Genre deleted') if genre.destroy
    end
  end
end
