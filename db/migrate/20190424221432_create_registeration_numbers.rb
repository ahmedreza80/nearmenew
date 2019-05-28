class CreateRegisterationNumbers < ActiveRecord::Migration[5.1]
  def change
    create_table :registeration_numbers do |t|
      t.string :code
      t.references :user

      t.timestamps
    end
  end
end
