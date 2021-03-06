class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.references :photoable, polymorphic: true, index: true
      t.string :url, null: false

      t.timestamps
    end
  end
end
