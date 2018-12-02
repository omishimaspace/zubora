class AddOriginalUrlToRecipe < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :original_url, :string
  end
end
