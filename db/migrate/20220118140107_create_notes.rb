# frozen_string_literal: true

class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.string :number, null: false, index: { unique: true }
      t.string :title, null: false
      t.text :content
      t.datetime :published_at

      t.timestamps
    end
  end
end
