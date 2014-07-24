class CreateLands < ActiveRecord::Migration
  def change
    create_table :lands do |t|
      t.string :title
      t.integer :price
      t.string :location
      t.string :description

      t.timestamps
    end
  end
end
