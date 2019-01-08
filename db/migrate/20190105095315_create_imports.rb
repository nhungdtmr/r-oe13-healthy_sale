class CreateImports < ActiveRecord::Migration[5.2]
  def change
    create_table :imports do |t|
      t.integer :employee_id
      t.integer :supplier_id

      t.timestamps
    end
  end
end
