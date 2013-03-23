class ThirdPartiesController < ApplicationController
  # GET /third_parties
  # GET /third_parties.json
  def index
    @third_parties = ThirdParty.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @third_parties }
    end
  end

  # GET /third_parties/1
  # GET /third_parties/1.json
  def show
    @third_party = ThirdParty.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @third_party }
    end
  end

  # GET /third_parties/new
  # GET /third_parties/new.json
  def new
    @third_party = ThirdParty.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @third_party }
    end
  end

  # GET /third_parties/1/edit
  def edit
    @third_party = ThirdParty.find(params[:id])
  end

  # POST /third_parties
  # POST /third_parties.json
  def create
    @third_party = ThirdParty.new(params[:third_party])

    respond_to do |format|
      if @third_party.save
        format.html { redirect_to @third_party, notice: 'Third party was successfully created.' }
        format.json { render json: @third_party, status: :created, location: @third_party }
      else
        format.html { render action: "new" }
        format.json { render json: @third_party.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /third_parties/1
  # PUT /third_parties/1.json
  def update
    @third_party = ThirdParty.find(params[:id])

    respond_to do |format|
      if @third_party.update_attributes(params[:third_party])
        format.html { redirect_to @third_party, notice: 'Third party was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @third_party.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /third_parties/1
  # DELETE /third_parties/1.json
  def destroy
    @third_party = ThirdParty.find(params[:id])
    @third_party.destroy

    respond_to do |format|
      format.html { redirect_to third_parties_url }
      format.json { head :no_content }
    end
  end
end
