# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Characters', type: :request do
  let(:character) { create(:character) }
  login_user

  describe 'GET /index' do
    it 'returns http success' do
      get '/api/v1/characters'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /api/v1/characters/create' do
    let(:character) { build(:character) }

    it 'returns http success' do
      post '/api/v1/characters/create', params: {
        character: {
          image: character.image,
          name: character.name,
          age: character.age,
          weight: character.weight,
          history: character.history
        }
      }

      expect(response).to have_http_status(:success)

      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:response][:message]).to eq('Character was successfully created.')
    end

    it 'does not create a character on invalid object' do
      post '/api/v1/characters/create', params: {
        character: {
          image: character.image,
          name: nil,
          age: character.age,
          weight: character.weight,
          history: character.history
        }
      }

      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:status]).to eq('unprocessable_entity')
    end
  end

  describe 'PUT /update' do
    it 'returns http success' do
      put "/api/v1/characters/#{character.id}", params: {
        character: {
          image: character.image,
          name: 'Fooman',
          age: character.age,
          weight: character.weight,
          history: character.history
        }
      }

      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:response][:character][:name]).to eq('Fooman')
    end

    it 'does not update a character on invalid object' do
      put "/api/v1/characters/#{character.id}", params: {
        character: {
          image: character.image,
          name: nil,
          age: character.age,
          weight: character.weight,
          history: character.history
        }
      }

      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:status]).to eq('unprocessable_entity')
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get "/api/v1/characters/#{character.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE /destroy' do
    it 'does delete a character with success' do
      delete "/api/v1/characters/#{character.id}"
      expect(response).to have_http_status(:success)

      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:response][:message]).to eq('Character deleted')
    end
  end
end
