class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :keyword

      t.timestamps
    end
    
    add_index  :keywords, :keyword
  end
end
