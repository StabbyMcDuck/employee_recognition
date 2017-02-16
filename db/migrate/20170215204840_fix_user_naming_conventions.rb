class FixUserNamingConventions < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.rename :roletype, :role_type
      t.remove :role
    end

    change_column_null :users, :role_type, false
  end
end