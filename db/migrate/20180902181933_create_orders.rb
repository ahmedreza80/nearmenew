class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :first_name
      t.string :last_name, null: false
      t.string :mobile_number
      t.string :email
      t.string :city
      t.string :pincode
      t.string :delivery_address
      t.string :tracking
      t.decimal :sub_total, precision: 15, scale: 2, null: false

      t.timestamps
    end
  end
end
