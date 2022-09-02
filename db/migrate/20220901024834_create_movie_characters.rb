# frozen_string_literal: true

class CreateMovieCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :movie_characters, id: :uuid do |t|
      t.references :movie, null: false, foreign_key: true, type: :uuid
      t.references :character, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
