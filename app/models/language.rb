# == Schema Information
# Schema version: 20101120032335
#
# Table name: languages
#
#  id         :integer         not null, primary key
#  iso_code   :string(255)
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Language < ActiveRecord::Base
  validates :iso_code, :presence => true,:uniqueness => true
  validates :name, :presence => true, :uniqueness => true

  attr_accessible :iso_code, :name
  
  cattr_reader :per_page
  @@per_page = 10

end
