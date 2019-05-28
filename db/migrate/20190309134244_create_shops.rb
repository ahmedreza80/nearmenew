class CreateShops < ActiveRecord::Migration[5.1]
  def change
    create_table :shops do |t|
      t.string :name
      t.text :description
      t.string :imageshop
      t.string :location
      t.string :web
      t.string :email
      t.string :phone
      t.string :business
      t.string :category

      t.timestamps
    end
  end
end
