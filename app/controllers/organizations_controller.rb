class OrganizationsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :edit, :create, :update, :destroy]

  # GET /organizations
  # GET /organizations.json
  def index
    @organizations = Organization.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @organizations }
    end
  end

  # GET /organizations/1
  # GET /organizations/1.json
  def show
    @organization = Organization.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @organization }
    end
  end

  def images
    @organization = Organization.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @organization.organization_images.map{|organization_image| organization_image.to_jq_upload} }
    end
  end

  # GET /organizations/new
  # GET /organizations/new.json
  def new
    @organization = Organization.new
    @address = Address.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @organization }
    end
  end

  # GET /organizations/1/edit
  def edit
    @organization = Organization.find(params[:id])
  end

  # POST /organizations
  # POST /organizations.json
  def create
    @organization = Organization.new(params[:organization])
    @address = Address.new(params[:address])
    @organization.address = @address
    current_user.organization = @organization

    respond_to do |format|
      if @address.save
        if@organization.save
          current_user.save
          session[:message] = "Organization was successfully created"
          format.html { redirect_to @organization, notice: 'Organization was successfully created' }
          format.json { render json: {"message" => "Organization was successfully created", "success" => true, "data" => @organization}, status: :created, location: @organization }
        else
          format.html { render action: "new" }
          format.json { render json: @organization.errors, status: :unprocessable_entity }
        end
      else
        format.html { render action: "new" }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /organizations/1
  # PUT /organizations/1.json
  def update
    @organization = Organization.find(params[:id])

    respond_to do |format|
      if @organization.update_attributes(params[:organization])
        format.html { redirect_to @organization, notice: 'Organization was successfully updated.' }
        format.json { render json: {"message" => "Organization was successfully updated", "success" => true, "data" => @organization}, status: :created, location: @organization }
      else
        format.html { render action: "edit" }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    @organization = Organization.find(params[:id])
    @organization.destroy

    respond_to do |format|
      format.html { redirect_to organizations_url }
      format.json { head :no_content }
    end
  end
end

