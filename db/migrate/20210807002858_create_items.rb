class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title,                null: false
      t.text :text,                   null: false
      t.string :weight,               null: false
      t.integer :area_id,             null: false
      t.date :catch_day,              null: false
      t.integer :class_id,            null: false
      t.string :tighten,              null: false
      t.string :process,              null: false
      t.string :process_timing,       null: false
      t.integer :storage_id,          null: false
      t.integer :shipping_charges_id, null: false
      t.integer :days_to_ship_id,     null: false
      t.integer :delivery_id,         null: false
      t.integer :shipping_area_id,    null: false
      t.integer :price,               null: false
      t.references :user,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
