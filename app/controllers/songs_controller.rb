class SongsController < ApplicationController
    def index
      @songs = Song.all
    end
  
    def show
      @song = Song.find(params[:id])
    end
  
    def new
      @song = Song.new
    end
  
    def edit
      @song = Song.find(params[:id])
    end
  
    def create
      @song = Song.create(song_params)
        if @song.valid?
        redirect_to song_path(@song)
      else
        flash[:song_errors] = @song.errors.full_messages
        redirect_to new_song_path
      end
    end
  
    def update
      @song = Song.find(params[:id])
      if @song.update(song_params)
        redirect_to song_path(@song)
      else
        flash[:song_errors] = @song.errors.full_messages
        redirect_to edit_song_path
      end
    end
  
    def destroy
      @song = Song.find(params[:id])
      @song.destroy
      redirect_to songs_path
    end
  
    private
  
    def song_params
      params.require(:song).permit(
        :title, :release_year, :released, :genre, :artist_name
      )
    end
  end