# frozen_string_literal: true

module Api
  module V1
    class CharactersController < ApplicationController
      include Paginate
      load_and_authorize_resource
      before_action :authenticate_user!, except: %i[index show]
      before_action :set_character, only: %i[show edit update destroy]
      has_scope :by_name, as: :name
      has_scope :by_age, as: :age
      has_scope :by_weight, as: :weight
      has_scope :by_movie, as: :movies

      def index
        characters = apply_scopes(Character).select(:id, :image, :name)
                                            .page(params[:page] || 1)
                                            .per(8)
        pagination(characters)
      end

      def new
        @character = Character.new
      end

      def create
        response = Characters::CreateCharacter.call(character: character_params, user: current_user)

        if response.success
          render json: { status: 200, response: }
        else
          render json: { status: :unprocessable_entity, errors: response.error }
        end
      end

      def update
        response = Characters::UpdateCharacter.call(character: @character, character_params:)

        if response.success
          render json: { status: 200, response: }
        else
          render json: { status: :unprocessable_entity, errors: response.error }
        end
      end

      def edit; end

      def show
        render json: { status: 200, character: @character, movies: @character.movies }
      end

      def destroy
        response = Characters::DestroyCharacter.call(character: @character)
        render json: { status: 204, response: } if response.success
      end

      private

      def set_character
        @character = Character.find(params[:id])
      end

      def character_params
        params.require(:character).permit(:image, :name, :age, :weight, :history)
      end
    end
  end
end
