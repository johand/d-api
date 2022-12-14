# frozen_string_literal: true

class Genre < ApplicationRecord
  belongs_to :user

  has_many :movie_genres, dependent: :destroy
  has_many :movies, through: :movie_genres

  validates :name,
            presence: { message: 'Required' },
            uniqueness: { message: 'Has already been taken' },
            length: { minimum: 3,
                      maximum: 20,
                      message: 'Minimum 3 and maximum 20 characters' }

  validates :image,
            presence: { message: 'Required' },
            format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]),
                      message: 'Invalid URL' }
end
