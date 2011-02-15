# == Schema Information
# Schema version: 20101120224654
#
# Table name: whiteboards
#
#  id                 :integer         not null, primary key
#  info               :text
#  created_at         :datetime
#  updated_at         :datetime
#  whiteboard_type_id :integer
#

class Whiteboard < ActiveRecord::Base
  attr_accessible  :info, :whiteboard_type_id
  belongs_to :whiteboard_type, :class_name=>"WhiteboardType", :foreign_key=>"whiteboard_type_id"
  
  cattr_reader :per_page
  @@per_page = 10

end
