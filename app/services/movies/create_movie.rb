# frozen_string_literal: true

module Movies
  class CreateMovie < ApplicationService
    attr_reader :movie, :user

    Result = ImmutableStruct.new(:success, :movie, :user, :error, :message)

    def initialize(params)
      @movie = params[:movie]
      @user = params[:user]
    end

    def call
      m = Movie.new(movie)
      m.user_id = user.id

      if m.save
        Result.new(success: true, movie:, user:, error: nil,
                   message: 'Movie was successfully created.')
      else
        Result.new(success: false, movie:, user:, error: m.errors)
      end
    end
  end
end
