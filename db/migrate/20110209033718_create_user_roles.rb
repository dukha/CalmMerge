class CreateUserRoles < ActiveRecord::Migration
  def self.up
    #drop_table :user_roles
    # the join table for :users has_many :trough :users_roles
    create_table :user_roles, :id => false do |t|
      t.references :user, :null => false
      t.references :role, :null => false
    end

#    change_table :user_roles do |t|
#      t.change :users_id, :integer,  :null => false
#      t.change :roles_id, :integer,  :null => false
#    end
  end

  def self.down
    drop_table :user_roles
  end
end
  
