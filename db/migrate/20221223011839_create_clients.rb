class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :description, null: false
      t.string :email,  null: false
      t.date :birth_date

      t.timestamps
    end
  end
end
