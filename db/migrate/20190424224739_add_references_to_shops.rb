class AddReferencesToShops < ActiveRecord::Migration[5.1]
  def change
    add_column :shops, :registeration_number_id, :integer
    add_index :shops, :registeration_number_id
  end
end
