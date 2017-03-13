class CascadeDeleteUserAwards < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key "awards", "users"
    remove_foreign_key "awards", column: "employee_id"
    remove_foreign_key "awards", column: "granter_id"
    remove_column "awards", "user_id"

    add_foreign_key "awards", "users", column: "employee_id", on_delete: :cascade
    add_foreign_key "awards", "users", column: "granter_id", on_delete: :cascade
  end
end
