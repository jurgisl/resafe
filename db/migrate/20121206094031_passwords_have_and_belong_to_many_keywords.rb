class PasswordsHaveAndBelongToManyKeywords < ActiveRecord::Migration
  def up
    create_table :keywords_passwords, :id => false do |t|
      t.references :keyword, :password
    end
  end

  def down
    drop_table :keywords_passwords
  end
end
