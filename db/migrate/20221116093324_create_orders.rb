class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.integer :customer_id, null: false
      t.integer :order_status, null: false
      t.string :name, null: false
      t.string :post_code, null: false
      t.string :address, null: false
      t.integer :postage, null: false
      t.integer :total_payment, null: false
      t.integer :method_of_payment, null: false
      
      t.timestamps
    end
  end
end
