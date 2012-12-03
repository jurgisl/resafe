class CreatePasswords < ActiveRecord::Migration
  def change
    create_table :passwords do |t|
      t.string :name
      t.text :description
      t.string :password
      t.belongs_to :category

      t.timestamps
    end
    add_index :passwords, :category_id
  end
end
