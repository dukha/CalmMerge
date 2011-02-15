# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
#treeRoot = Area.create :name => "world"
#localhost = Area.create :name => "localhost", :parent_id => treeRoot.id

treeRoot = Area.create :name => "world"
localhost = Area.create :name => "localhost", :parent_id => treeRoot.id

Language.delete_all
Language.create!(:iso_code=> "en", :name=>"English")
Language.create!(:iso_code=> "nl", :name=>"Nederlands")
#log.info("Language data inserted successfully.")

WhiteboardType.delete_all
WhiteboardType.create!(:name=>"system", :translation_code=>"system")
WhiteboardType.create!(:name=>"local admin", :translation_code=>"localadmin")
WhiteboardType.create!(:name=>"user", :translation_code=>"user")
#log.info("Whiteboard Type data inserted successfully.")

Whiteboard.delete_all
Whiteboard.create!(:whiteboard_type_id=> WhiteboardType.find_by_name("system").id, :info=>"New version of Calm will be online tomorrow." )
Whiteboard.create!(:whiteboard_type_id=> WhiteboardType.find_by_name("local admin").id, :info=>"Female quota exceeded for 2 Dec. No more confirmations.")
Whiteboard.create!(:whiteboard_type_id=> WhiteboardType.find_by_name("user").id, :info=>"Need a new printer cartridge in office. Who can order it?")


# The roles for authorization
Role.delete_all
Role.create! :name => :world_config, :description => "Can change everything in all locations"
Role.create! :name => :superuser, :description => "Can change everything in his/her authorized organisation"
admin = Role.create :name => :admin, :description => "Can add a venue in his/her authorized organisation"
Role.create! :name => :registrar, :description => "Can access only what is necessary to process an application"

Organisation.delete_all
Organisation.create!(:name=>"Rasmi", :parent_id=>localhost.id)

User.delete_all
user1 = User.create!(:email=> "mark@gmail.com", :password=>"xxxxxx",:username=>"mark", 
        :language_id=>Language.find_by_iso_code("en").id, :password_confirmation=>"xxxxxx",
      :subdomain=> Organisation.find_by_name("Rasmi"))



UserRole.delete_all
UserRole.create!(:user_id=> user1.id, :role_id => admin.id)
