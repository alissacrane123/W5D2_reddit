class ChangeSubColumn < ActiveRecord::Migration[5.2]
  def change
    remove_index :posts, :sub_id 
    remove_column :posts, :sub_id
    
  end
end
