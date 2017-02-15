class FixAwardNamingConventions < ActiveRecord::Migration[5.0]
  def change
    change_table :awards do |t|
      t.rename :awardtype, :award_type
      t.rename :employeeemail, :employee_email
      t.rename :employeename, :employee_name
      t.remove :grantedby
      t.references :granter, foreign_key: { to_table: :users }, index: true, null: false
      t.references :employee, foreign_key: { to_table: :users }, index: true, null: true
    end

    change_column_null :awards, :award_type, false
    change_column_null :awards, :employee_email, false
    change_column_null :awards, :employee_name, false
    change_column_null :awards, :granter_id, false
  end
end
