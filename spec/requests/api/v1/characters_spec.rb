# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Characters', type: :request do
  let(:user) { create(:user, username: 'zxcvbn', email: 'qwerty@qwerty.com') }
  let(:character) { create(:character, user_id: user.id) }

  describe 'GET /index' do
    it 'returns http success' do
      get '/api/v1/characters'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    let(:character) { build(:character) }

    it 'returns http success' do
      sign_in user

      post '/api/v1/characters/create', params: {
        character: {
          image: character.image,
          name: character.name,
          age: character.age,
          weight: character.weight,
          history: character.history,
          user_id: user.id
        }
      }

      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:response][:message]).to eq('Character was successfully created.')
    end

    it 'does not create a character on invalid object' do
      sign_in user

      post '/api/v1/characters/create', params: {
        character: {
          image: character.image,
          name: nil,
          age: character.age,
          weight: character.weight,
          history: character.history,
          user_id: user.id
        }
      }

      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:status]).to eq('unprocessable_entity')
    end
  end

  describe 'PUT /update' do
    it 'returns http success' do
      sign_in user

      put "/api/v1/characters/#{character.id}", params: {
        character: {
          image: character.image,
          name: 'Fooman',
          age: character.age,
          weight: character.weight,
          history: character.history,
          user_id: user.id
        }
      }

      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:response][:character][:name]).to eq('Fooman')
      expect(json[:response][:message]).to eq('Character was successfully updated.')
    end

    it 'does not update a character on invalid object' do
      sign_in user

      put "/api/v1/characters/#{character.id}", params: {
        character: {
          image: character.image,
          name: nil,
          age: character.age,
          weight: character.weight,
          history: character.history,
          user_id: user.id
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
      sign_in user

      delete "/api/v1/characters/#{character.id}"

      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:response][:message]).to eq('Character deleted')
    end
  end
end
