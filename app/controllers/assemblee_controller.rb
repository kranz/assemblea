class AssembleeController < ApplicationController
  # GET /assemblee
  # GET /assemblee.json
  def index
    @assemblee = Assemblea.page(params[:page]).order('data ASC, nome ASC').all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @assemblee }
    end
  end

  # GET /assemblee/1
  # GET /assemblee/1.json
  def show
    @assemblea = Assemblea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @assemblea }
    end
  end

  # GET /assemblee/new
  # GET /assemblee/new.json
  def new
    @assemblea = Assemblea.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @assemblea }
    end
  end

  # GET /assemblee/1/edit
  def edit
    @assemblea = Assemblea.find(params[:id])
  end

  # POST /assemblee
  # POST /assemblee.json
  def create
    @assemblea = Assemblea.new(params[:assemblea])

    respond_to do |format|
      if @assemblea.save
        format.html { redirect_to @assemblea, notice: 'Assemblea was successfully created.' }
        format.json { render json: @assemblea, status: :created, location: @assemblea }
      else
        format.html { render action: "new" }
        format.json { render json: @assemblea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /assemblee/1
  # PUT /assemblee/1.json
  def update
    @assemblea = Assemblea.find(params[:id])

    respond_to do |format|
      if @assemblea.update_attributes(params[:assemblea])
        format.html { redirect_to @assemblea, notice: 'Assemblea was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @assemblea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assemblee/1
  # DELETE /assemblee/1.json
  def destroy
    @assemblea = Assemblea.find(params[:id])
    @assemblea.destroy

    respond_to do |format|
      format.html { redirect_to assemblee_url }
      format.json { head :no_content }
    end
  end

  def setassemblea
    @oldid = session[:assemblea_id]
    session[:assemblea_id] = params[:assemblea_id]
    @assid = params[:assemblea_id]
    @nomeass = Assemblea.find(params[:assemblea_id]).nome
  end
end
