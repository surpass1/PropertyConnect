class CreateMyProperties < ActiveRecord::Migration
  def change
    create_table :my_properties do |t|
      t.string :type
      t.string :status
      t.string :size
      t.string :plot_number
      t.string :village
      t.decimal :price
      t.string :email
      t.integer :phone

      t.timestamps
    end
  end
end
