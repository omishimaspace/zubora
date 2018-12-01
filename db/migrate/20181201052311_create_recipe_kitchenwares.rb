class CreateRecipeKitchenwares < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_kitchenwares do |t|
      t.refferences :recipes
      t.references :kitchenwares, foreign_key: true

      t.timestamps
    end
  end
end
