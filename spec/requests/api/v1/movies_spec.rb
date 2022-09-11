# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'Api::V1::Movies', type: :request do
  let(:user) { create(:user, username: 'zxcvbn', email: 'qwerty@qwerty.com') }
  let(:movie) { create(:movie, user_id: user.id) }

  describe 'GET /index' do
    it 'returns http success' do
      get '/api/v1/movies'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    let(:movie) { build(:movie) }

    it 'returns http success' do
      sign_in user

      post '/api/v1/movies/create', params: {
        movie: {
          image: movie.image,
          title: movie.title,
          date: movie.date,
          qualification: movie.qualification,
          user_id: user.id
        }
      }

      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:response][:message]).to eq('Movie was successfully created.')
    end

    it 'does not create a movie on invalid object' do
      sign_in user

      post '/api/v1/movies/create', params: {
        movie: {
          image: movie.image,
          title: nil,
          date: movie.date,
          qualification: movie.qualification,
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

      put "/api/v1/movies/#{movie.id}", params: {
        movie: {
          image: movie.image,
          title: 'Foo title',
          date: movie.date,
          qualification: movie.qualification,
          user_id: user.id
        }
      }

      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:response][:movie][:title]).to eq('Foo title')
      expect(json[:response][:message]).to eq('Movie was successfully updated.')
    end

    it 'does not update a movie on invalid object' do
      sign_in user

      put "/api/v1/movies/#{movie.id}", params: {
        movie: {
          image: movie.image,
          title: nil,
          date: movie.date,
          qualification: movie.qualification,
          user_id: user.id
        }
      }

      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:status]).to eq('unprocessable_entity')
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get "/api/v1/movies/#{movie.id}/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get "/api/v1/movies/#{movie.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE /destroy' do
    it 'does delete a movie with success' do
      sign_in user

      delete "/api/v1/movies/#{movie.id}"

      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:response][:message]).to eq('Movie deleted')
    end
  end
end
