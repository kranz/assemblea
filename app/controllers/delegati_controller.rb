class DelegatiController < ApplicationController
  # GET /delegati
  # GET /delegati.json
  def index
    @delegati = Delegato.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @delegati }
    end
  end

  # GET /delegati/1
  # GET /delegati/1.json
  def show
    @delegato = Delegato.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @delegato }
    end
  end

  # GET /delegati/new
  # GET /delegati/new.json
  def new
    @delegato = Delegato.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @delegato }
    end
  end

  # GET /delegati/1/edit
  def edit
    @delegato = Delegato.find(params[:id])
  end

  # POST /delegati
  # POST /delegati.json
  def create
    @delegato = Delegato.new(params[:delegato])

    respond_to do |format|
      if @delegato.save
        format.html { redirect_to @delegato, notice: 'Delegato was successfully created.' }
        format.json { render json: @delegato, status: :created, location: @delegato }
      else
        format.html { render action: "new" }
        format.json { render json: @delegato.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /delegati/1
  # PUT /delegati/1.json
  def update
    @delegato = Delegato.find(params[:id])

    respond_to do |format|
      if @delegato.update_attributes(params[:delegato])
        format.html { redirect_to @delegato, notice: 'Delegato was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @delegato.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /delegati/1
  # DELETE /delegati/1.json
  def destroy
    @delegato = Delegato.find(params[:id])
    @delegato.destroy

    respond_to do |format|
      format.html { redirect_to delegati_url }
      format.json { head :no_content }
    end
  end
end
