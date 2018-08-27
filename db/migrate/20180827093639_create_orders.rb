class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.float :total_price
      t.datetime :date_order
      t.boolean :is_confirm, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
