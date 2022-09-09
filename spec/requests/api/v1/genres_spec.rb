# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Genres', type: :request do
  let(:user) { create(:user, username: 'zxcvbn', email: 'qwerty@qwerty.com') }
  let(:genre) { create(:genre, user_id: user.id) }

  describe 'GET /index' do
    it 'returns http success' do
      get '/api/v1/genres'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    let(:genre) { build(:genre) }

    it 'returns http success' do
      sign_in user

      post '/api/v1/genres/create', params: {
        genre: {
          name: genre.name,
          image: genre.image,
          user_id: user.id
        }
      }

      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:response][:message]).to eq('Genre was successfully created.')
    end

    it 'does not create a genre on invalid object' do
      sign_in user

      post '/api/v1/genres/create', params: {
        genre: {
          name: nil,
          image: genre.image,
          user_id: user.id
        }
      }

      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:status]).to eq('unprocessable_entity')
    end
  end

  describe 'PUT /update' do
    it 'returns http success' do
      sign_in user

      put "/api/v1/genres/#{genre.id}", params: {
        genre: {
          name: 'Foo name',
          image: genre.image,
          user_id: user.id
        }
      }

      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:response][:genre][:name]).to eq('Foo name')
      expect(json[:response][:message]).to eq('Genre was successfully updated.')
    end

    it 'does not update a genre on invalid object' do
      sign_in user

      put "/api/v1/genres/#{genre.id}", params: {
        genre: {
          name: nil,
          image: genre.image,
          user_id: user.id
        }
      }

      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:status]).to eq('unprocessable_entity')
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get "/api/v1/genres/#{genre.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE /destroy' do
    it 'returns http success' do
      sign_in user

      delete "/api/v1/genres/#{genre.id}"

      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:response][:message]).to eq('Genre deleted')
    end
  end
end
