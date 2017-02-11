class FixColumnName < ActiveRecord::Migration[5.0]
  def change
  	 rename_column :awards, :employeeename, :employeename
  end
end
