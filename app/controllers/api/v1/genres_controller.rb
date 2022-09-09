# frozen_string_literal: true

module Api
  module V1
    class GenresController < ApplicationController
      include Paginate
      load_and_authorize_resource
      before_action :authenticate_user!, except: %i[index show]
      before_action :set_genre, only: %i[show edit update destroy]

      def index
        genres = Genre.select(:id, :image, :name).page(params[:page] || 1).per(8)
        pagination(genres)
      end

      def new
        @genre = Genre.new
      end

      def create
        response = Genres::CreateGenre.call(genre: genre_params, user: current_user)

        if response.success
          render json: { status: 200, response:, message: response.message }
        else
          render json: { status: :unprocessable_entity, errors: response.error }
        end
      end

      def update
        response = Genres::UpdateGenre.call(genre: @genre, genre_params:)

        if response.success
          render json: { status: 200, response: }
        else
          render json: { status: :unprocessable_entity, errors: response.error }
        end
      end

      def edit; end

      def show
        render json: { status: 200, genre: @genre }
      end

      def destroy
        response = Genres::DestroyGenre.call(genre: @genre)

        render json: { status: 200, response:, message: response.message } if response.success
      end

      private

      def set_genre
        @genre = Genre.find(params[:id])
      end

      def genre_params
        params.require(:genre).permit(:name, :image)
      end
    end
  end
end
