class CreateAwards < ActiveRecord::Migration[5.0]
  def change
    create_table :awards do |t|
      t.string :type
      t.string :employeename
      t.string :employeeemail
      t.timestamp :datecreated
      t.string :grantedby
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
