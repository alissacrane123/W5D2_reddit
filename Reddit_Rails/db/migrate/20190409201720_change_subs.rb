class ChangeSubs < ActiveRecord::Migration[5.2]
  def change
    remove_index :subs, :author_id 
    add_column :subs, :name, :string, null: false
    add_column :subs, :moderator_id, :integer, null: false
    add_index :subs, :moderator_id 
  end
end
