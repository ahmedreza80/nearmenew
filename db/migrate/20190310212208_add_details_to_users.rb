class AddDetailsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string
    add_column :users, :phone, :string
    add_column :users, :location, :string
    add_column :users, :pincode, :string
  end
end
