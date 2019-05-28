class AddNewFieldToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :state, :string
    add_column :products, :city, :string
  end
end
