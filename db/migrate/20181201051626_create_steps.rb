class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.references :recipe, foreign_key: true
      t.integer :position
      t.text :description

      t.timestamps
    end
  end
end
