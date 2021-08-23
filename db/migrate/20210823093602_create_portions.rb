# frozen_string_literal: true

class CreatePortions < ActiveRecord::Migration[5.2]
  def change
    create_table :portions do |t|
      t.string :name
      t.string :external_id
      t.integer :item_id
      t.integer :price

      t.timestamps
    end
  end
end
