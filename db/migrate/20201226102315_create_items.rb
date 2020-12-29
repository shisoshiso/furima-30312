class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :category_id, null: false
      t.integer :item_status_id, null: false
      t.integer :delivery_fee_id, null: false
      t.integer :ship_from_area_id, null: false
      t.integer :days_to_delivery_id, null: false
      t.integer :price, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end