# frozen_string_literal: true

class Character < ApplicationRecord
  belongs_to :user

  has_many :movie_characters, dependent: :destroy
  has_many :movies, through: :movie_characters

  validates :image,
            presence: { message: 'Required' },
            format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]),
                      message: 'Invalid URL' }

  validates :name,
            presence: { message: 'Required' },
            uniqueness: { message: 'Has already been taken' },
            length: { minimum: 3,
                      maximum: 20,
                      message: 'Minimum 3 and maximum 20 characters' }

  validates :age,
            numericality: {
              greater_than: 0,
              less_than_or_equal_to: 999,
              message: 'Invalid age must be between 1 and 3 digits'
            }

  validates :weight,
            numericality: {
              greater_than: 0,
              less_than_or_equal_to: 999,
              message: 'Invalid weight must be between 1 and 3 digits'
            }

  validates :history,
            presence: { message: 'Required' },
            length: { minimum: 20,
                      maximum: 2000,
                      message: 'Minimum 20 and maximum 2000 characters' }

  scope :by_name, ->(name) { where('lower(name) LIKE ?', "%#{sanitize_sql_like(name.downcase)}%") }
  scope :by_age, ->(age) { where(age:) }
  scope :by_weight, ->(weight) { where(weight:) }
  scope :by_movie, lambda { |movie|
    joins(:movies).where('lower(movies.title) LIKE ?', "%#{sanitize_sql_like(movie.downcase)}%")
  }
end
