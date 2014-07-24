class AddAvatarsToScrapers < ActiveRecord::Migration
  def self.up
    change_table :scrapers do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :scrapers, :avatar
  end
end
