# frozen_string_literal: true

class MovieCharacter < ApplicationRecord
  belongs_to :movie
  belongs_to :character
end
