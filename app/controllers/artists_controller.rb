class ArtistsController < ApplicationController
  # skip_before_action :authorize
    # before_action :set_artist, only: [:show, :edit]

  def index
    @artists = Artist.all
  end

  def show
    @user = set_artist
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      session[:artist_id] = @artist.id
      respond_to do |format|
        format.js { render inline: "location.reload();" }
        format.html { redirect_to root_url  }
      end
    else
      # binding.pry
      respond_to do |format|
        format.js { }
        format.html { redirect_to root_url  }
      end
    end
  end

  def edit
    @artist = set_artist
    tip = Tip.find(params[:tip_id])
    unless current_artist.tips.include?(tip)
      current_artist.tips.push(tip)
      current_artist.save
    end
    respond_to do |format|
      format.js { }
      format.html { redirect_to root_url  }
    end
  end

  def delete_tip
    @tip = Tip.find(params[:tip_id])
    @tip_id = @tip.id
    current_artist.tips.destroy(@tip)
    respond_to do |format|
      format.js { }
      format.html { redirect_to root_url  }
    end
  end

  def destroy
      @artist.destroy
      @artist = Artist.new
      respond_to do |format|
        format.html { redirect_to artists_url }
        format.json { head :no_content }
      end
  end

  private
    def set_artist
      @artist = Artist.find(params[:id])
    end

    def artist_params
      params.require(:artist).permit(:name, :id, :email, :password, :password_confirmation)
    end

end
