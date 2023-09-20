class CreateExpense < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.string :name, null: false
      t.decimal :amount, null: false
      t.references :user, foreign_key: true, null: false, on_delete: :cascade
      t.references :category, foreign_key: true, null: false, on_delete: :cascade

      t.timestamps
    end
  end
end
