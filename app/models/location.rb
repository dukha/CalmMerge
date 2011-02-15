require 'acts_as_tree'

class Location < ActiveRecord::Base
  acts_as_tree
  validates_uniqueness_of :name

  def to_s
    "#{self.class} #{self.name}"
  end

  # Location is an abstract superclass
  # Need to redirect to concrete subclass' controllers
  def controller_name
    self.class.name.downcase.pluralize
  end

  def may_have_children?
    true
  end

  def has_organisation_ancestor?
   ancestor = self
   while ancestor != nil do
     if ancestor.class == Organisation
       return true
     end
     ancestor = ancestor.parent
   end
   false
  end
end
