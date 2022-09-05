# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Movies', type: :request do
  let(:movie) { create(:movie) }
  login_user

  describe 'GET /index' do
    it 'returns http success' do
      get '/api/v1/movies'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    let(:movie) { build(:movie) }

    it 'returns http success' do
      post '/api/v1/movies/create', params: {
        movie: {
          image: movie.image,
          title: movie.title,
          date: movie.date,
          qualification: movie.qualification
        }
      }

      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:response][:message]).to eq('Movie was successfully created.')
    end

    it 'does not create a movie on invalid object' do
      post '/api/v1/movies/create', params: {
        movie: {
          image: movie.image,
          title: nil,
          date: movie.date,
          qualification: movie.qualification
        }
      }

      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:status]).to eq('unprocessable_entity')
    end
  end

  describe 'PUT /update' do
    it 'returns http success' do
      put "/api/v1/movies/#{movie.id}", params: {
        movie: {
          image: movie.image,
          title: 'Foo title',
          date: movie.date,
          qualification: movie.qualification
        }
      }

      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:response][:movie][:title]).to eq('Foo title')
      expect(json[:response][:message]).to eq('Movie was successfully updated.')
    end

    it 'does not update a movie on invalid object' do
      put "/api/v1/movies/#{movie.id}", params: {
        movie: {
          image: movie.image,
          title: nil,
          date: movie.date,
          qualification: movie.qualification
        }
      }

      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:status]).to eq('unprocessable_entity')
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
      delete "/api/v1/movies/#{movie.id}"

      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:response][:message]).to eq('Movie deleted')
    end
  end
end
