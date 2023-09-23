class AddOnDeleteCascadeToForeignKeys < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :categories, :users
    add_foreign_key :categories, :users, on_delete: :cascade

    remove_foreign_key :expenses, :categories
    add_foreign_key :expenses, :categories, on_delete: :cascade

    remove_foreign_key :expenses, :users
    add_foreign_key :expenses, :users, on_delete: :cascade
  end
end
