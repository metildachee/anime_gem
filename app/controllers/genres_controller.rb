class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
  end

  def new
    @genre = Genre.new
  end

  def create
    if Genre.create(genre_param).save
      redirect_to genres_path
    else 
      render :new
    end 
  end

  def edit 
    @genre = Genre.find(params[:id])
  end 

  def update 
    if Genre.find(params[:id]).update(genre_param)
      redirect_to genres_path
    else 
      render :edit
    end 
  end 

  def destroy
  end

  private 
  def genre_param
    params.require(:genre).permit(:name, :desc)
  end 
end
