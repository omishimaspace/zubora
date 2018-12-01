class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.references :recipes, foreign_key: true
      t.references :foods, foreign_key: true
      t.integer :amount
      t.string :unit

      t.timestamps
    end
  end
end
