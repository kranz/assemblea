class SezioniController < ApplicationController
  # GET /sezioni
  # GET /sezioni.json
  def index
    @sezioni = Sezione.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sezioni }
    end
  end

  def elenco
    @sezioni = Sezione.order('nome').all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sezioni }
    end
  end

  # GET /sezioni/1
  # GET /sezioni/1.json
  def show
    @sezione = Sezione.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sezione }
    end
  end

  # GET /sezioni/new
  # GET /sezioni/new.json
  def new
    @sezione = Sezione.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sezione }
    end
  end

  # GET /sezioni/1/edit
  def edit
    @sezione = Sezione.find(params[:id])
  end

  # POST /sezioni
  # POST /sezioni.json
  def create
    @sezione = Sezione.new(params[:sezione])

    respond_to do |format|
      if @sezione.save
        format.html { redirect_to sezioni_path, notice: 'Sezione was successfully created.' }
        format.json { render json: @sezione, status: :created, location: @sezione }
      else
        format.html { render action: "new" }
        format.json { render json: @sezione.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sezioni/1
  # PUT /sezioni/1.json
  def update
    @sezione = Sezione.find(params[:id])

    respond_to do |format|
      if @sezione.update_attributes(params[:sezione])
        format.html { redirect_to elencosezioni_path, notice: 'Sezione was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sezione.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sezioni/1
  # DELETE /sezioni/1.json
  def destroy
    @sezione = Sezione.find(params[:id])
    @sezione.destroy

    respond_to do |format|
      format.html { redirect_to sezioni_url }
      format.json { head :no_content }
    end
  end
end
