class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.float :net_weight
      t.float :price
      t.integer :quanity_in_store
      t.string :description
      t.integer :supplier_id
      t.integer :category_id

      t.timestamps
    end
  end
end
