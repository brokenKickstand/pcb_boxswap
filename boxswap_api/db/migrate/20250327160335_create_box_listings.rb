class CreateBoxListings < ActiveRecord::Migration[8.0]
  def change
    create_table :box_listings do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.integer :quantity
      t.string :size
      t.string :condition
      t.string :location
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
