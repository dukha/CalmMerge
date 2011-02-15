class CreateWhiteboardTypes < ActiveRecord::Migration
  def self.up
    create_table :whiteboard_types do |t|
      t.string :name
      t.string :translation_code

      t.timestamps
    end
  end

  def self.down
    drop_table :whiteboard_types
  end
end
