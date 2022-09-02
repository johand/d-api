# frozen_string_literal: true

class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters, id: :uuid do |t|
      t.string :image
      t.string :name
      t.integer :age
      t.integer :weight
      t.string :history
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
