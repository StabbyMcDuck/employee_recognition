class AddGranterSignature < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.binary :signature, null: false, :limit => 10.megabyte
    end
  end
end
