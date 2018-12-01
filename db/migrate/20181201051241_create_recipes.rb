class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :elapsed_minutes
      t.integer :score
      t.text :description

      t.timestamps
    end
  end
end
