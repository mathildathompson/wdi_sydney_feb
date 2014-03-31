class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find params[:id]
  end

  def new
    @artist = Artist.new
  end

  def create
    artist = Artist.new(params[:artist])

    if artist.save
      redirect_to artist #shortcut to artist_path(artist.id)
    else
      render 'form'
    end
  end

  def edit
    @artist = Artist.find params[:id]
  end

  def update
    artist = Artist.find params[:id]
    artist.update_attributes(params[:artist])
    # artist.save
    redirect_to artist
  end

  def destroy
    artist = Artist.find params[:id]
    artist.destroy
    redirect_to artists_path
  end
end
