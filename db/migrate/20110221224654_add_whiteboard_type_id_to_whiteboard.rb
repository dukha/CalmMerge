class AddWhiteboardTypeIdToWhiteboard < ActiveRecord::Migration
  def self.up
    add_column :whiteboards, :whiteboard_type_id, :integer
  end

  def self.down
    remove_column :whiteboards, :whiteboard_type_id
  end
end
