class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code,    default: "",  null: false
      t.integer :prefecture_id,               null: false
      t.string :municipalities, default: "",  null: false
      t.string :house_number,   default: "",  null: false
      t.string :tel_number,     default: "",  null: false
      t.string :building,       default: ""
      t.references :buy_log,    null: false,  foreign_key: true
      t.timestamps
    end
  end
end
