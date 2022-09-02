# frozen_string_literal: true

class Movie < ApplicationRecord
  belongs_to :user

  has_many :movie_characters
  has_many :characters, through: :movie_characters

  has_many :movie_genres
  has_many :genres, through: :movie_genres

  validates :image,
            presence: { message: 'Required' },
            format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]),
                      message: 'Invalid URL' }

  validates :title,
            presence: { message: 'Required' },
            uniqueness: { message: 'Has already been taken' },
            length: { minimum: 4,
                      maximum: 50,
                      message: 'Minimum 4 and maximum 50 characters' }

  validates :date, presence: { message: 'Required' }
  validates :qualification,
            numericality: {
              greater_than: 0,
              less_than_or_equal_to: 5,
              message: 'Invalid qualification must be between 1 and 5 points'
            }
end
