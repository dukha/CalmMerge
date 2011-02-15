class LocationsController < ApplicationController
# create, new and update is invoked directly on subclass controller, NOT here
# and index, show, edit and destroy are redirected from here

  before_filter :authenticate_user! # , :except => [:show, :index]
  filter_resource_access

  # Ask subclass of location for controller name and redirect there
  def redirect(delete=false)
    location = Location.find(params[:id])
    if delete
      if location.controller_name == "areas"
        redirect_to delete_area_url, :id => params[:id]
      end
      if location.controller_name == "venues"
        redirect_to delete_venue_url, :id => params[:id]
      end
      if location.controller_name == "organisations"
        redirect_to delete_organisation_url, :id => params[:id]
      end
      flash[:notice] = "Invalid Controller"
    else
      params[:controller] = location.controller_name
      redirect_to params
    end
  end


  # GET /locations
  # that root of tree exists is guaranteed by seeds.rb
  # todo" who guarantees that we have only one root?
  def index
    @data_file_path = 'the location hierarchy'

    #root must be an area with parent_id nil
    @root_node = Location.find_by_parent_id(nil)

  end

  # GET /locations/1
  # GET /locations/1.xml
  def show
    self.redirect
  end


  # GET /locations/1/edit
  def edit
    self.redirect
  end

  # GET /locations/1/delete
  def destroy
    self.redirect(true)
  end

  # helper to show location tree
  def display_segment( node )
    html = "<li>".html_safe
    node_class = "folder"
    if  node.class == Venue
      node_class = "file"
    end
    if  node.class == Organisation
      node_class = "web-browser"
    end
    if node == nil then
      html << "<span class=\"#{node_class}\"> <a href=\"/location_tree/NIL\">Found NIL</a> </span>".html_safe
      html << "<ul id=\"children_of_NIL\">".html_safe

    else
      html << "<span class=\"#{node_class}\"> <a href=\"/location_tree/#{node.id}\">#{node.to_s}</a> </span>".html_safe
      html << "<ul id=\"children_of_#{node.id}\">".html_safe
      node.children.each{|child_node|
        html << display_segment( child_node )}
    end
    html << "</ul></li>".html_safe
  end
  helper_method :display_segment

end
