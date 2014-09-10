class AddStatusToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :status, :string
    add_column :properties, :contact, :string
  end
end
