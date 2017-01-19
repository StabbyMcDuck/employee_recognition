class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      # User Name
      t.string    :name, null: false

      # Authlogic::ActsAsAuthentic::Email
      t.string    :email, null: false

      # Authlogic::ActsAsAuthentic::Password
      t.string    :crypted_password, null: false
      t.string    :password_salt, null: false

      # Authlogic::ActsAsAuthentic::PersistenceToken
      t.string    :persistence_token, null: true

      # Authlogic::ActsAsAuthentic::PerishableToken
      t.string    :perishable_token, null: true

      t.timestamps
    end
  end
end
