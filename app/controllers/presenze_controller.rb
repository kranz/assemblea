class PresenzeController < ApplicationController
  before_filter :require_assemblea
  # GET /presenze
  # GET /presenze.json
  def index
    @assemblea = Assemblea.find(session[:assemblea_id])
    if @assemblea.generale 
      socio_class = Delegato
      @presenze = Presenza.joins(:delegato).order('delegati.socio').find(:all, :conditions => ['assemblea_id = ?', "#{session[:assemblea_id]}"])
    else
      socio_class = Socio
      @presenze = Presenza.joins(:socio).order('soci.socio').find(:all, :conditions => ['assemblea_id = ?', "#{session[:assemblea_id]}"])
      @totpresenti = @presenze.count
      @perdelega = Presenza.find(:all, :conditions => ['assemblea_id = ? AND condelega = ?', "#{session[:assemblea_id]}", "SI"]).count
      @presenti = @totpresenti - @perdelega
    end
    @soci = socio_class.page(params[:page]).order('socio').search(params[:search])
    if @soci
      if @soci.count == 1
        redirect_to registra_url(@soci[0])
      else
        respond_to do |format|
          format.html # index.html.erb
          format.json { render json: @presenze }
        end
      end
    end
  end

  def report
    @assemblea = Assemblea.find(session[:assemblea_id])
    if @assemblea.generale 
      socio_class = Delegato
      @presenze = Presenza.find(:all, :conditions => ['assemblea_id = ?', "#{session[:assemblea_id]}"])
      @delegati = Presenza.joins(:delegato).order('delegati.socio').find(:all, :conditions => ['assemblea_id = ? AND isdelegato=?', "#{session[:assemblea_id]}","SI"])
    else
      socio_class = Socio
      @delegati = Presenza.joins(:socio).order('soci.socio').find(:all, :conditions => ['assemblea_id = ? AND isdelegato=?', "#{session[:assemblea_id]}", "SI"])
      @presenze = Presenza.joins(:socio).order('soci.socio').find(:all, :conditions => ['assemblea_id =?', "#{session[:assemblea_id]}"])
    end
    @assemblea.orafine = Time.now
    @assemblea.stato = "CHIUSA"
    @totpresenti = Presenza.find(:all, :conditions => ['assemblea_id = ?', "#{session[:assemblea_id]}"]).count
    @perdelega = Presenza.find(:all, :conditions => ['assemblea_id = ? AND condelega = ?', "#{session[:assemblea_id]}", "SI"]).count
    @presenti = @totpresenti - @perdelega
    respond_to do |format|
      if @assemblea.save
        format.html # index.html.erb
      else
        format.html {redirect_to presenze_path, notice: t('noreport')}
      end
    end
  end


  # GET /presenze/1
  # GET /presenze/1.json
  def show
    @presenza = Presenza.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @presenza }
    end
  end

  # GET /presenze/new
  # GET /presenze/new.json
  def new
    @presenza = Presenza.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @presenza }
    end
  end

  # GET /presenze/1/edit
  def edit
    @presenza = Presenza.find(params[:id])
  end

  # POST /presenze
  # POST /presenze.json
  def create
    @presenza = Presenza.new(params[:presenza])

    respond_to do |format|
      if @presenza.save
        format.html { redirect_to @presenza, notice: 'Presenza was successfully created.' }
        format.json { render json: @presenza, status: :created, location: @presenza }
      else
        format.html { render action: "new" }
        format.json { render json: @presenza.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /presenze/1
  # PUT /presenze/1.json
  def update
    @presenza = Presenza.find(params[:id])

    respond_to do |format|
      if @presenza.update_attributes(params[:presenza])
        format.html { redirect_to @presenza, notice: 'Presenza was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @presenza.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /presenze/1
  # DELETE /presenze/1.json
  def destroy
    @presenza = Presenza.find(params[:id])
    @presenza.destroy

    respond_to do |format|
      format.html { redirect_to presenze_url }
      format.json { head :no_content }
    end
  end

  def registra
    @assemblea = Assemblea.find(session[:assemblea_id])
    if @assemblea.generale 
      socio_class = Delegato
      @checkpres = Presenza.where("socio_id=? and assemblea_id=?",params[:socio_id],session[:assemblea_id])
    else
      socio_class = Socio
      @checkpres = Presenza.where("socio_id=?",params[:socio_id])
    end
    @socio = socio_class.find(params[:socio_id])
#    @checkpres = Presenza.find_by_socio_id(params[:socio_id])
    if @checkpres.empty?
      @presenza = Presenza.new
      @presenza.assemblea_id = session[:assemblea_id]
      @presenza.socio_id = params[:socio_id]
      if @assemblea.generale
        @presenza.delegato_id = params[:socio_id]
      end
      @presenza.condelega = params[:condelega] 
      @presenza.presente = "SI"
      @presenza.isdelegato = ""
      respond_to do |format|
        if @presenza.save
          format.html { redirect_to presenze_path, notice: 'Registrata presenza per ' + @socio.socio }
          format.json { render json: @presenza, status: :created, location: @presenza }
        else
          format.html { render action: "new" }
          format.json { render json: @presenza.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to presenze_path, alert: @socio.socio + t('ispresent') + @checkpres[0].assemblea.nome
    end
  end 

  def setdelegato
    @presenza = Presenza.find(params[:presenza_id])
    @socio=Socio.find(params[:socio_id])
    msg = @presenza.isdelegato == "" ? "isappointed" : "isnotappointed"
    @presenza.isdelegato = @presenza.isdelegato == "" ? "SI" : ""
    respond_to do |format|
      if @presenza.save
        format.html { redirect_to presenze_path, notice: @socio.socio + t(msg)}
      else
        format.html { render action: "new" }
      end    
    end
  end

  def invia_delegati
    @presenze = Presenza.where("isdelegato=?", "SI").where("assemblea_id = ?", session[:assemblea_id])
    @presenze.each do |presenza|
      @delegato = Delegato.where("socio = ?", presenza.socio.socio)
      if @delegato.count > 0 
        puts "I MINOLLI GIA CI STANNO"
      else
        @attribs = presenza.socio.attributes
        %w"id created_at updated_at".each{|v| @attribs.delete(v)}
        @delegato = Delegato.new(@attribs)
        @delegato.sezione = presenza.assemblea.sezione.nome
        @delegato.save
        presenza.delegato = @delegato
        presenza.save
        @delegato = :nil
      end
    end
    respond_to do |format|
      format.html
    end
  end

  private
 
  def require_assemblea
    unless assemblea_in_corso?
      flash[:error] = "Occorre scegliere un'assemblea prima di registrare le presenze"
      redirect_to assemblee_url # torna a scelta assemblea
    end
  end
 
  # The logged_in? method simply returns true if the user is logged
  # in and false otherwise. It does this by "booleanizing" the
  # current_user method we created previously using a double ! operator.
  # Note that this is not common in Ruby and is discouraged unless you
  # really mean to convert something into true or false.
  def assemblea_in_corso?
    !!session[:assemblea_id]
  end
end
