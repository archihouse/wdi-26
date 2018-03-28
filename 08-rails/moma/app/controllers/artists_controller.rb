class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def create
    artist = Artist.create artist_params
    redirect_to artist # /artists/:some_id i.e. the show page
  end

  def edit
  end

  def show
    @artist = Artist.find params[:id]
  end

  def destroy
    artist = Artist.find params[:id]
    artist.destroy
    redirect_to artists_path
  end

  # Strong params: a whitelist of permitted fields
  private
  def artist_params
    params.require(:artist).permit(:name, :nationality, :dob, :period, :image)
  end
end
