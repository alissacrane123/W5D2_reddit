class ChangeSubsColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :subs, :title
    
  end
end
