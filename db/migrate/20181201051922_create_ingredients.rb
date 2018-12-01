class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.references :recipe, foreign_key: true
      t.references :food, foreign_key: true
      t.integer :amount
      t.string :unit

      t.timestamps
    end
  end
end
