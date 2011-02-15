class CreateCourseTypes < ActiveRecord::Migration
  def self.up
    create_table :course_types do |t|
      t.string :oldcode
      t.string :translation_code
      t.string :name
      t.string :description
      t.integer :last_day

      t.timestamps
    end
  end

  def self.down
    drop_table :course_types
  end
end
