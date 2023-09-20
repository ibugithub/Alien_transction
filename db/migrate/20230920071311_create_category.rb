class CreateCategory < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name , null: false
      t.string :icon, null: true
      t.references :user, foreign_key: true, null: false, on_delete: :cascade

      t.timestamps
    end
  end
end
