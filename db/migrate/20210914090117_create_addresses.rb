class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :municipalities,   null: false
      t.string :address,   null: false
      t.string :postal_code,   null: false
      t.string :building_name
      t.string :telephone_number,   null: false
      t.integer :shippingarea_id,   null: false
      t.references :purchase, foreign_key: true
      t.timestamps
    end
  end
end
