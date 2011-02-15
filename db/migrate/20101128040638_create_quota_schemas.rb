class CreateQuotaSchemas < ActiveRecord::Migration
  def self.up
    create_table :quota_schemas do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :quota_schemas
  end
end
