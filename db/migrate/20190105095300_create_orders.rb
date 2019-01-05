class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :receiver
      t.integer :user_id
      t.string :order_place
      t.string :order_phone
      t.integer :status
      t.string :description

      t.timestamps
    end
  end
end
