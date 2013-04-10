class PetsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :edit, :create, :update, :destroy]

  # GET /pets
  # GET /pets.json
  def index
    @pets = Pet.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pets }
    end
  end

  # GET /pets/1
  # GET /pets/1.json
  def show
    @pet = Pet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pet }
    end
  end

  def uploader
    @pet = Pet.find(params[:id])
    response.headers["Last-Modified"] = Time.now.httpdate.to_s
    response.headers["Expires"] = 0.to_s
    # HTTP 1.0
    response.headers["Pragma"] = "no-cache"
    # HTTP 1.1 'pre-check=0, post-check=0' (IE specific)
    response.headers["Cache-Control"] = 'no-store, no-cache, must-revalidate, max-age=0, pre-check=0, post-check=0'
    response.headers['Content-type'] = 'application/javascript; charset=utf-8'
    render :action => 'uploader', :layout => false, :content_type => 'text/javascript'
  end

  def images
    @pet = Pet.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pet.pet_images.map{|pet_image| pet_image.to_jq_upload} }
    end
  end

  # GET /pets/new
  # GET /pets/new.json
  def new
    @pet = Pet.new
    @breeds = [::Bertslist::Breeds::Cat, ::Bertslist::Breeds::Dog];
    @craigslist = ThirdParty.new

    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pet }
    end
  end

  # GET /pets/1/edit
  def edit
    @breeds = [::Bertslist::Breeds::Cat, ::Bertslist::Breeds::Dog];
    @pet = Pet.find(params[:id])
  end

  # POST /pets
  # POST /pets.json
  def create
    @pet = Pet.new(params[:pet])
    @pet.user_id = current_user.id

    respond_to do |format|
      if @pet.save
        session[:message] = "Pet was successfully listed"
        format.html { redirect_to @pet, notice: 'Pet was successfully listed' }
        format.json { render json: {"message" => "Pet was successfully listed", "success" => true, "data" => @pet}, status: :created, location: @pet }
      else
        format.html { render action: "new" }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pets/1
  # PUT /pets/1.json
  def update
    @pet = Pet.find(params[:id])

    respond_to do |format|
      if @pet.update_attributes(params[:pet])
        format.html { redirect_to @pet, notice: 'Pet was successfully updated.' }
        format.json { render json: {"message" => "Pet was successfully updated", "success" => true, "data" => @pet}, status: :created, location: @pet }
      else
        format.html { render action: "edit" }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pets/1
  # DELETE /pets/1.json
  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy

    respond_to do |format|
      format.html { redirect_to pets_url }
      format.json { head :no_content }
    end
  end
end
