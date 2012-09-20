class PetImagesController < ApplicationController
  # GET /uploads
  # GET /uploads.json
  def index
    @pet_images = PetImage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pet_images.map{|upload| upload.to_jq_upload } }
    end
  end

  # GET /uploads/1
  # GET /uploads/1.json
  def show
    @pet_image = PetImage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pet_image }
    end
  end

  # GET /uploads/new
  # GET /uploads/new.json
  def new
    @pet_image = PetImage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pet_image }
    end
  end

  # GET /uploads/1/edit
  def edit
    @pet_image = PetImage.find(params[:id])
  end

  # POST /uploads
  # POST /uploads.json
  def create
    @pet_image = PetImage.new(params[:pet_image])
    @pet_image.pet_id = params[:pet_id]

    respond_to do |format|
      if @pet_image.save
        format.html {
          render :json => [@pet_image.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json { render json: [@pet_image.to_jq_upload].to_json, status: :created, location: @pet_image }
      else
        puts "oh jeeez errors"
        puts @pet_image.errors.inspect
        format.html { render action: "new" }
        format.json { render json: @pet_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /uploads/1
  # PUT /uploads/1.json
  def update
    @pet_image = PetImage.find(params[:id])

    respond_to do |format|
      if @pet_image.update_attributes(params[:upload])
        format.html { redirect_to @pet_image, notice: 'PetImage was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pet_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uploads/1
  # DELETE /uploads/1.json
  def destroy
    @pet_image = PetImage.find(params[:id])
    @pet_image.destroy

    respond_to do |format|
      format.html { redirect_to uploads_url }
      format.json { head :no_content }
    end
  end
end
