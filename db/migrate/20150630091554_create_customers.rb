class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.integer :customer_id
      t.string :email
      t.string :occupation
      t.datetime :birthday
      t.string :shop_domain

      t.timestamps null: false
    end
  end
end
