class SongsController < ApplicationController
  # index
  def index
    @songs = Song.all
  end

  # new
  def new
    # search for the artist, then creat new song attached to artist_id
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.new
  end

  # create
  def create
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.create!(song_params)

    redirect_to artist_path(@artist)
  end

  #show
  def show
    @artist = Artist.find(params[:artist_id])
    @song = Song.find(params[:id])
  end

  # edit
  def edit
    @artist = Artist.find(params[:artist_id])

    @song = Song.find(params[:id])
  end

  # update
  def update
    @artist = Artist.find(params[:artist_id])
    @song = Song.find(params[:id])
    @song.update(song_params)

    redirect_to artist_song_path(@artist, @song)
  end

  # destroy
  def destroy
    @artist = Artist.find(params[:artist_id])
    @song = Song.find(params[:id])
    @song.destroy

    redirect_to artist_path(@artist)
  end

  private
  def song_params
    params.require(:song).permit(:title, :album, :preview_url, :artist_id)
  end
end
