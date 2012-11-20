class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end 

  def show
    genre_id = params[:id]
    @genre = Genre.find(genre_id)
  end

  def create
    @genre = Genre.new(params[:genre])    
    if @genre.save
        redirect_to genres_path
    else
      render :new
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update_attributes(params[:genre])
      redirect_to @genre
    else
      render :edit
    end  
  end

  def destroy
    genre = Genre.find(params[:id])
    Genre.delete(genre)
    redirect_to genres_path
  end

end



