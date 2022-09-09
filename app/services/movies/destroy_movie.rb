# frozen_string_literal: true

module Movies
  class DestroyMovie < ApplicationService
    attr_reader :movie

    Result = ImmutableStruct.new(:success, :movie, :message)

    def initialize(params)
      @movie = params[:movie]
    end

    def call
      Result.new(success: true, movie:, message: 'Movie deleted') if movie.destroy
    end
  end
end
