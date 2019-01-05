class CreateImportDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :import_details do |t|
      t.integer :import_id
      t.integer :product_id
      t.integer :quanity
      t.float :price

      t.timestamps
    end
  end
end
