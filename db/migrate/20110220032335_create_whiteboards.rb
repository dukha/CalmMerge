class CreateWhiteboards < ActiveRecord::Migration
  def self.up
    create_table :whiteboards do |t|
      t.text :info

      t.timestamps
    end
  end

  def self.down
    drop_table :whiteboards
  end
end
