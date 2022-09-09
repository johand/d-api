# frozen_string_literal: true

module Genres
  class UpdateGenre < ApplicationService
    attr_reader :genre, :genre_params

    Result = ImmutableStruct.new(:success, :genre, :error, :message)

    def initialize(params)
      @genre = params[:genre]
      @genre_params = params[:genre_params]
    end

    def call
      if genre.update(genre_params)
        Result.new(success: true, genre:, error: nil,
                   message: 'Genre was successfully updated.')
      else
        Result.new(success: false, genre:, error: genre.errors)
      end
    end
  end
end
