class CreateKitchenwares < ActiveRecord::Migration[5.2]
  def change
    create_table :kitchenwares do |t|
      t.string :name

      t.timestamps
    end
  end
end
