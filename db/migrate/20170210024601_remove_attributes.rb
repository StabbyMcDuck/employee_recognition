class RemoveAttributes < ActiveRecord::Migration[5.0]
  def change
  	remove_column :awards, :user_id
  	remove_column :awards, :datecreated
  end
end
