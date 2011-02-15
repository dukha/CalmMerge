# == Schema Information
# Schema version: 20101120032335
#
# Table name: whiteboard_types
#
#  id               :integer         not null, primary key
#  name             :string(255)
#  translation_code :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

class WhiteboardType < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness=>true
  validates :translation_code, :presence => true, :uniqueness=>true

  attr_accessible :name, :translation_code
  
  cattr_reader :per_page
  @@per_page = 10

end
