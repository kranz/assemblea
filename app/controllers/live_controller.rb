class LiveController < ApplicationController
  before_filter :assemblea_generale

  def index
    @presenze = Presenza.find(:all, :conditions => ['assemblea_id = ?', "#{session[:assemblea_id]}"])
    @totale = Delegato.all.count
    @presenti = @presenze.count
    @percpresenti = ((@presenti.to_f / @totale.to_f) * 100).to_i
    @quorum = (@totale*75/100).to_i
    @differenza = @presenti - @quorum
    @diffid = @differenza < 0 ? 'testo-rosso' : 'testo-verde'
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @delegati }
    end
  end

  def assemblea_generale
    if session[:assemblea_id]
    	@assemblea = Assemblea.find(session[:assemblea_id]) 
      unless @assemblea.generale
        flash[:error] = t ("errors.fnonlydelegati")
        redirect_to assemblee_url # torna a scelta assemblea
      end
    else
        flash[:error] = t("errors.selmeetdel")
        redirect_to assemblee_url # torna a scelta assemblea
    end
  end

end
