class AdminSignaturesNotRequired < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :signature, :binary, null: true
  end
end
