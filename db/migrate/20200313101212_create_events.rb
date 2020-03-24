# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :location, null: false
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.string :organizer_email, null: false
      t.string :organizer_telegram, null: false
      t.string :link, null: false
      t.timestamps
    end
  end
end
