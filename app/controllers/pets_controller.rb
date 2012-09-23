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
    puts "pets new!"
    logger.debug "LOL LOGGER"
    @pet = Pet.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pet }
    end
  end

  # GET /pets/1/edit
  def edit
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
