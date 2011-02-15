class VenuesController < ApplicationController
  # GET /venues
  # GET /venues.xml
  def index
    @venues = Venue.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @venues }
    end
  end

  # GET /venues/1
  # GET /venues/1.xml
  def show
    @venue = Venue.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @venue }
    end
  end

  # GET /venues/new
  # GET /venues/new.xml
  # and also for tree there is route:
  #  new_child_area        /venues/new/:id(.:format)          {:controller=>"venues", :action=>"new"}
  def new
    @venue = Venue.new
    @venue.parent_id = params[:id] # needs to be kept by view in hidden field to get it to the create action


    respond_to do |format|
      if @venue.parent.may_have_children?
        format.html # new.html.erb
      else
        format.html { redirect_to(locations_url, :notice => "#{@venue.parent.to_s} cannot have children.") }
      end
      format.xml  { render :xml => @venue }
    end
  end

  # GET /venues/1/edit
  def edit
    @venue = Venue.find(params[:id])
  end

  # POST /venues
  # POST /venues.xml
  def create
    @venue = Venue.new(params[:venue])

    respond_to do |format|
      if @venue.save
        format.html { redirect_to(locations_url, :notice => "#{@venue.to_s} was successfully created.") }
        format.xml  { render :xml => @venue, :status => :created, :location => @venue }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @venue.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /venues/1
  # PUT /venues/1.xml
  def update
    @venue = Venue.find(params[:id])

    respond_to do |format|
      if @venue.update_attributes(params[:venue])
        format.html { redirect_to(locations_url, :notice => "#{@venue.to_s} was successfully updated.") }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @venue.errors, :status => :unprocessable_entity }
      end
    end
  end

  # GET /venues/1/delete
  # GET /venues/1.xml/delete
  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy
    flash[:notice] = "Deleted #{@venue.to_s}"
    respond_to do |format|
      format.html { redirect_to(locations_url) }
      format.xml  { head :ok }
    end
  end
end
