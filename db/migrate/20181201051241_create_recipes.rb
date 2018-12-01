class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :elapsed_minutes, null: false
      t.float :score, null: false, default: 0.0
      t.text :description

      t.timestamps
    end
  end
end
