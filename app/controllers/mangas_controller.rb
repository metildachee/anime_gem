class MangasController < ApplicationController
  def index
    @mangas = Manga.all
  end

  def show
    @manga = Manga.find(params[:id])
  end

  def edit
    @manga = Manga.find(params[:id])
    @genres = Genre.all
    @artists = Artist.all
  end

  def update # must be a better way to write this function..
    @manga = Manga.find(params[:id])

    if params[:artist] == @manga.artist.id && @manga.update(mangas_params)
      # no changes to the artist ID
      update_genre(@manga, params[:genres]).save
      redirect_to mangas_path
    elsif params[:artist] != @manga.artist.id
      # changed to another artist
      @manga.destroy # we destroy this instance, also removing all references
      @manga = Artist.find(params[:artist]).mangas.build(mangas_params) # build a new one with the new artist ID
      if update_genre(@manga, params[:genres]).save
        # update_genre(@manga)
        redirect_to mangas_path
      else 
        render :edit
      end
    else 
      render :edit
    end 
  end

  def new
    @manga = Manga.new
    @artists = Artist.all
    @genres = Genre.all
  end

  def create
    @manga = Artist.find(params[:artist]).mangas.build(mangas_params)

    if update_genre(@manga, params[:genres]).save
        redirect_to mangas_path
    else 
        render :new 
    end 
  end 
  
  def destroy
    if Manga.find(params[:id]).destroy
      redirect_to mangas_path
    end
  end

  private

  def mangas_params
    params.require(:manga).permit(:title, :desc, :img_path, :artist, :genre_id)
  end 

  # @params manga => an manga AR
  # @params genres_arr => an array of genre.id
  # @returns the updated manga
  def update_genre(manga, genres_arr)
    manga.genre.clear
    genres_arr.each do |genre_id|
      manga.genre << Genre.find(genre_id)
    end 
    return manga
  end
  
end
