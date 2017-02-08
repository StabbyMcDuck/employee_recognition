class CreateAwards < ActiveRecord::Migration[5.0]
  def change
    create_table :awards do |t|
      t.string :awardtype
      t.string :employeeename
      t.string :employeeemail
      t.timestamp :datecreated
      t.string :grantedby

      t.timestamps
    end
  end
end
