# frozen_string_literal: true

module Movies
  class UpdateMovie < ApplicationService
    attr_reader :movie, :movie_params

    Result = ImmutableStruct.new(:success, :movie, :error, :message)

    def initialize(params)
      @movie = params[:movie]
      @movie_params = params[:movie_params]
    end

    def call
      if movie.update(movie_params)
        Result.new(success: true, movie:, error: nil,
                   message: 'Movie was successfully updated.')
      else
        Result.new(success: false, movie:, error: movie.errors)
      end
    end
  end
end
