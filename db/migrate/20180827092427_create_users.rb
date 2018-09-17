class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :address
      t.string :phone
      t.integer :role, null: false, default: 0

      ## Rememberable
      t.datetime :remember_created_at

      t.timestamps null: false
    end
  add_index :users, :email, unique: true
  end
end
