# frozen_string_literal: true

class CreateMovieGenres < ActiveRecord::Migration[7.0]
  def change
    create_table :movie_genres, id: :uuid do |t|
      t.references :movie, null: false, foreign_key: true, type: :uuid
      t.references :genre, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
