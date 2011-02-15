class AddUniquenessIndexes < ActiveRecord::Migration
  def self.up
    add_index :course_types, :name, :unique => true
    add_index :whiteboard_types, :name, :unique => true
    add_index :languages, :iso_code, :unique => true
    add_index :course_types, :translation_code, :unique => true
    add_index :whiteboard_types, :translation_code, :unique => true
    add_index :languages, :name, :unique => true
  end

  def self.down
    remove_index :course_types, :name
    remove_index :whiteboard_types, :name
    remove_index :course_types, :translation_code
    remove_index :whiteboard_types, :translation_code
    remove_index :languages, :name
    remove_index :languages, :iso_code
  end
end
