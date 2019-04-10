class RemoveSubsAuthorColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :subs, :author_id
  end
end
