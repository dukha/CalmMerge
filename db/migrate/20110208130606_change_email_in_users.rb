class ChangeEmailInUsers < ActiveRecord::Migration
  def self.up
    remove_index :users, :email
    # rmoves index index_users_on_email

    add_index :users, [:username, :subdomain],     :unique => true
    #postgres: "index_users_on_username_and_subdomain" UNIQUE, btree (username, subdomain)
  end

  def self.down
    remove_index :users, :username_and_subdomain
    add_index :users, :email,                :unique => true
  end
end
