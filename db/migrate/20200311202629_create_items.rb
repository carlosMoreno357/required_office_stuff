class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :description
      t.integer :status
      t.text :details, null: true
      t.references :category, null:false, foreign_key: {to_table: :categories}
      t.references :user, null:false, foreign_key: {to_table: :users}
    end
  end
end
