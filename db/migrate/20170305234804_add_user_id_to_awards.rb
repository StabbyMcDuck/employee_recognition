class AddUserIdToAwards < ActiveRecord::Migration[5.0]
  def change
    add_reference :awards, :user, foreign_key: true
  end
end
