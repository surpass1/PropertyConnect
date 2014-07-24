class CreateScrapers < ActiveRecord::Migration
  def change
    create_table :scrapers do |t|
      t.string :location
      t.string :price
      t.string :description

      t.timestamps
    end
  end
end
