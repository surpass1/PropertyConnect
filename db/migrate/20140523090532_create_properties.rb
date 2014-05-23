class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :title
      t.string :location
      t.decimal :price
      t.string :description

      t.timestamps
    end
  end
end
