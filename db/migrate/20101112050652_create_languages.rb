class CreateLanguages < ActiveRecord::Migration
  def self.up
    create_table :languages do |t|
      t.string :iso_code
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :languages
  end
end