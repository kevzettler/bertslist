class AddressesController < ApplicationController
  before_filter :authenticate_user!

  # GET /addresss
  # GET /addresss.json
  def index
    @addresss = Address.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @addresss }
    end
  end

  # GET /addresss/1
  # GET /addresss/1.json
  def show
    @address = Address.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @address }
    end
  end

  # GET /addresss/new
  # GET /addresss/new.json
  def new
    require "bertslist/geo"
    @address = Address.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @address }
    end
  end

  # GET /addresss/1/edit
  def edit
    @address = Address.find(params[:id])
  end

  # POST /addresss
  # POST /addresss.json
  def create
    @address = Address.new(params[:address])

    respond_to do |format|
      if @address.save
        current_user.add_flag('verified')
        current_user.address = @address
        current_user.save
        format.html { redirect_to new_pet_path, notice: 'Thank you for verifying your account. You can now list pets!' }
        format.json { render json: {"message" => "Address was successfully listed", "success" => true, "data" => @address}, status: :created, location: @address }
      else
        format.html { render action: "new" }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /addresss/1
  # PUT /addresss/1.json
  def update
    @address = Address.find(params[:id])

    respond_to do |format|
      if @address.update_attributes(params[:address])
        format.html { redirect_to @address, notice: 'Address was successfully updated.' }
        format.json { render json: {"message" => "Address was successfully updated", "success" => true, "data" => @address}, status: :created, location: @address }
      else
        format.html { render action: "edit" }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addresss/1
  # DELETE /addresss/1.json
  def destroy
    @address = Address.find(params[:id])
    @address.destroy

    respond_to do |format|
      format.html { redirect_to addresss_url }
      format.json { head :no_content }
    end
  end
end

