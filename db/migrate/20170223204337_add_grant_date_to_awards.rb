class AddGrantDateToAwards < ActiveRecord::Migration[5.0]
  def change
    change_table :awards do |t|
      t.date :grant_date, null: false
    end
  end
end
