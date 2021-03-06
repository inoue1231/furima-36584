class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string :name,   null: false
      t.text :profile,   null: false
      t.integer :category_id,   null: false
      t.integer :status_id,   null: false
      t.integer :shippingarea_id,   null: false
      t.integer :shippingcharge_id,   null: false
      t.integer :daystoship_id,   null: false
      t.integer :price,   null: false
      t.references :user, foreign_key: true
     
      t.timestamps null: false



    end
  end
end
