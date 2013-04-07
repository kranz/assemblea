class SociController < ApplicationController

  def index
    @soci = Socio.page(params[:page]).search(params[:search])
  end

  def show
    @socio = Socio.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @socio }
    end
  end

  def new
    @socio = Socio.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @socio }
    end
  end

  # GET /soci/1/edit
  def edit
    @socio = Socio.find(params[:id])
  end

  def create
    @socio = Socio.new(params[:socio])

    respond_to do |format|
      if @socio.save
        format.html { redirect_to @socio, notice: 'Socio was successfully created.' }
        format.json { render json: @socio, status: :created, location: @socio }
      else
        format.html { render action: "new" }
        format.json { render json: @socio.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @socio = Socio.find(params[:id])

    respond_to do |format|
      if @socio.update_attributes(params[:socio])
        format.html { redirect_to @socio, notice: 'Socio was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @socio.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @socio = Socio.find(params[:id])
    @socio.destroy

    respond_to do |format|
      format.html { redirect_to soci_url }
      format.json { head :no_content }
    end
  end

end
