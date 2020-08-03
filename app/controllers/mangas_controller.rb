class MangasController < ApplicationController
  before_action :set_manga, only: [:show, :edit, :update]
  before_action :get_all_artists, only: [:edit, :create, :new]

  def index; @mangas = Manga.all; end

  def show; end
  def edit; end

  def update
    if params[:artist] == @manga.artist.id && @manga.update(mangas_params)
      return redirect_to mangas_path
    end 
    
    if params[:artist] != @manga.artist.id
      @manga.destroy
      if Artist.find(params[:artist]).mangas.build(mangas_params).save 
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
  end

  def create
    @manga = Manga.new(mangas_params)
    @manga.artist = Artist.find(params[:artist])

    if @manga.save
      Artist.find(params[:artist]).mangas << @manga
      redirect_to mangas_path
    else
      render :new
    end 
  end 
  
  def destroy
    return redirect_to mangas_path if Manga.find(params[:id]).destroy
  end

  private

  def mangas_params
    params.require(:manga).permit(:title, :desc, :img_path, :artist, genre_ids: [])
  end 

  def set_manga
    @manga = Manga.find(params[:id])
  end 

  def get_all_artists
    @artists = Artist.all
  end 

end 
