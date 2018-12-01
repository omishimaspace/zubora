class CreateRecipeKitchenwares < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_kitchenwares do |t|
      t.references :recipe
      t.references :kitchenware, foreign_key: true

      t.timestamps
    end
  end
end
