# frozen_string_literal: true

module Api
  module V1
    class MoviesController < ApplicationController
      include Paginate
      load_and_authorize_resource
      before_action :authenticate_user!, except: %i[index show]
      before_action :set_movie, only: %i[show edit update destroy]
      has_scope :by_title, as: :title
      has_scope :by_genre, as: :genre
      has_scope :by_order, as: :order

      def index
        movies = apply_scopes(Movie).select(:id, :image, :title, :date)
                                    .page(params[:page] || 1)
                                    .per(8)
        pagination(movies)
      end

      def new
        @movie = Movie.new
      end

      def create
        response = Movies::CreateMovie.call(movie: movie_params, user: current_user)

        if response.success
          render json: { status: 200, response: }
        else
          render json: { status: :unprocessable_entity, errors: response.error }
        end
      end

      def update
        response = Movies::UpdateMovie.call(movie: @movie, movie_params:)

        if response.success
          render json: { status: 200, response: }
        else
          render json: { status: :unprocessable_entity, errors: response.error }
        end
      end

      def edit; end

      def show
        render json: { status: 200, movie: @movie, characters: @movie.characters }
      end

      def destroy
        response = Movies::DestroyMovie.call(movie: @movie)
        render json: { status: 204, response: } if response.success
      end

      private

      def set_movie
        @movie = Movie.find(params[:id])
      end

      def movie_params
        params.require(:movie).permit(:image, :title, :date, :qualification)
      end
    end
  end
end
