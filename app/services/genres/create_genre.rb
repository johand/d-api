# frozen_string_literal: true

module Genres
  class CreateGenre < ApplicationService
    attr_reader :genre, :user

    Result = ImmutableStruct.new(:success, :genre, :user, :error, :message)

    def initialize(params)
      @genre = params[:genre]
      @user = params[:user]
    end

    def call
      g = Genre.new(genre)
      g.user_id = user.id

      if g.save
        Result.new(success: true, genre:, user:, error: nil,
                   message: 'Genre was successfully created.')
      else
        Result.new(success: false, genre:, user:, error: g.errors)
      end
    end
  end
end
