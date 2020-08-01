class MangasController < ApplicationController
  def index
    @mangas = Manga.all
  end

  def show
    @manga = Manga.find(params[:id])
  end

  def edit
    @manga = Manga.find(params[:id])
    @artists = Artist.all
  end

  def update
    @manga = Manga.find(params[:id])

    if params[:artist] == @manga.artist.id && @manga.update(mangas_params)
      # no changes to the artist ID
      redirect_to mangas_path
    elsif params[:artist] != @manga.artist.id
      # changed to another artist
      @manga.destroy # we destroy this instance, also removing all references
      if Artist.find(params[:artist]).mangas.build(mangas_params).save 
        # build a new one with the new artist ID
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
  end

  def create
    @manga = Artist.find(params[:artist]).mangas.build(mangas_params)
    if @manga.save
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
    params.require(:manga).permit(:title, :desc, :img_path, :artist)
  end 
end
