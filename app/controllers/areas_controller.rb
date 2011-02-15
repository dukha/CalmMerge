class AreasController < ApplicationController
  # GET /areas
  # GET /areas.xml
  def index
    @areas = Area.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @areas }
    end
  end

  # GET /areas/1
  # GET /areas/1.xml
  def show
    @area = Area.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @area }
    end
  end

  # GET /areas/new
  # GET /areas/new.xml
  # and also for tree there is route:
  #  new_child_area        /areas/new/:id(.:format)          {:controller=>"areas", :action=>"new"}
  def new
    @area = Area.new
    @area.parent_id = params[:id] # needs to be kept by view in hidden field to get it to the create action
    
    respond_to do |format|
      if @area.parent.may_have_children?
        format.html # new.html.haml
      else
        format.html { redirect_to(locations_url, :notice => "#{@area.parent.to_s} cannot
 have children.") }
      end
      format.xml  { render :xml => @area }
    end
  end

  # GET /areas/1/edit
  def edit
    @area = Area.find(params[:id])
  end

  # POST /areas
  # POST /areas.xml
  def create
    #params[:area] ==  {"parent_id"=>"21","name"=>"test4"} parent id from hidden field, name from field
    @area = Area.new(params[:area])

    respond_to do |format|
      if @area.save
        #format.html { redirect_to(@area, :notice => 'Area was successfully created.') }
        format.html { redirect_to(locations_url, :notice => "#{@area.to_s} was successfully created.") }
        format.xml  { render :xml => @area, :status => :created, :location => @area }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @area.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /areas/1
  # PUT /areas/1.xml
  def update
    @area = Area.find(params[:id])

    respond_to do |format|
      if @area.update_attributes(params[:area])
        #format.html { redirect_to(@area, :notice => "#{@area.to_s} was successfully updated.") }
        format.html { redirect_to(locations_url, :notice => "#{@area.to_s} was successfully updated.") }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @area.errors, :status => :unprocessable_entity }
      end
    end
  end

  # GET /areas/1/delete
  # GET /areas/1.xml/delete
  def destroy
    @area = Area.find(params[:id])
    if @area.children.size == 0 and @area.name != "localhost"
      @area.destroy
      flash[:notice] = "Deleted #{@area.to_s}"   
    else
      flash[:notice] = "#{@area.to_s} not deleted. It has children or is the localhost node."   
    end

    respond_to do |format|
      #format.html { redirect_to(areas_url) }
      format.html { redirect_to(locations_url) }
      format.xml  { head :ok }
    end
  end
end
