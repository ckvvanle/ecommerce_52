class AddDeletedAtToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :deleted_at, :datetime
    add_index :products, :deleted_at

    add_column :comments, :deleted_at, :datetime
    add_index :comments, :deleted_at

    add_column :order_items, :deleted_at, :datetime
    add_index :order_items, :deleted_at
  end
end
