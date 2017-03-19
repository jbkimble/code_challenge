class CreateStreetCafes < ActiveRecord::Migration[5.0]
  def change
    create_table :street_cafes do |t|
      t.string :name
      t.string :address
      t.string :postcode
      t.integer :chairs_num
    end
  end
end
