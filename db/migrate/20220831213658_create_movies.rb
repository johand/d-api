# frozen_string_literal: true

class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies, id: :uuid do |t|
      t.string :image
      t.string :title
      t.datetime :date
      t.integer :qualification

      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
