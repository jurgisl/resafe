class CategoriesHaveAndBelongToManyGroups < ActiveRecord::Migration
  def up
    create_table :categories_groups, :id => false do |t|
      t.references :group, :category
    end
  end

  def down
    drop_table :categories_groups
  end
end
