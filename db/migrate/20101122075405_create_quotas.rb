class CreateQuotas < ActiveRecord::Migration
  def self.up
    create_table :quotas do |t|
      t.string :name
      t.integer :initial_quota
      t.integer :quota
      t.integer :days_from_start_init_to_real

      t.timestamps
    end
  end

  def self.down
    drop_table :quotas
  end
end
