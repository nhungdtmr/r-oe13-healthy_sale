class CreateSupplierProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :supplier_products do |t|
      t.integer :supplier_id
      t.integer :product_id

      t.timestamps
    end
  end
end
