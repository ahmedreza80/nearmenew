class AddAreaFieldToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :area, :string
  end
end
