class OrganisationsController < ApplicationController
  # GET /organisations
  # GET /organisations.xml
  def index
    @organisations = Organisation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @organisations }
    end
  end

  # GET /organisations/1
  # GET /organisations/1.xml
  def show
    @organisation = Organisation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @organisation }
    end
  end

  # GET /organisations/new
  # GET /organisations/new.xml
  def new
    @organisation = Organisation.new
    @organisation.parent_id = params[:id] # needs to be kept by view in hidden field to get it to the create action

    respond_to do |format|
      if @organisation.parent.may_have_children?
        unless @organisation.parent.has_organisation_ancestor?
          format.html # new.html.haml
        else
          format.html { redirect_to(locations_url, :notice => "#{@organisation.parent.to_s} is already under an organisation.") }
        end
      else
        format.html { redirect_to(locations_url, :notice => "#{@organisation.parent.to_s} cannot have children.") }
      end
      format.xml  { render :xml => @organisation }
    end

  end

  # GET /organisations/1/edit
  def edit
    @organisation = Organisation.find(params[:id])
  end

  # POST /organisations
  # POST /organisations.xml
  def create
    @organisation = Organisation.new(params[:organisation])

    respond_to do |format|
      if @organisation.save
        format.html { redirect_to(locations_url, :notice => "#{@organisation.to_s} was successfully created.") }
        format.xml  { render :xml => @organisation, :status => :created, :location => @organisation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @organisation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /organisations/1
  # PUT /organisations/1.xml
  def update
    @organisation = Organisation.find(params[:id])

    respond_to do |format|
      if @organisation.update_attributes(params[:organisation])
        format.html { redirect_to(locations_url, :notice => "#{@organisation.to_s} was successfully updated.") }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @organisation.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @organisation = Organisation.find(params[:id])

    if @organisation.children.size == 0 and @organisation.name != "localhost"
      @organisation.destroy
      flash[:notice] = "Deleted #{@organisation.to_s}"
    else
      flash[:notice] = "#{@organisation.to_s} not deleted. It has children or is the localhost node."
    end

    respond_to do |format|
      format.html { redirect_to(locations_url) }
      format.xml  { head :ok }
    end
  end
end
