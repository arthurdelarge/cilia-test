class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :description, null: false
      t.string :long_description
      t.float :price, null: false

      t.timestamps
    end
  end
end
