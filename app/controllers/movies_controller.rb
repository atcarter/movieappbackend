class MoviesController < ApplicationController

  def index
    movies = Movie.all
    render json: movies
  end

  def show
    if the_movie_exists?
      movie = Movie.find_by_id(params[:id])
      render json: movie
    else
      render json: {error: "Movie not found."}
    end
  end

  def create
    movie = Movie.new(movie_params)

    if movie.save
      render json: movie
    end
  end

  def destroy
    movie = Movie.find_by_id(params[:id])
    movie.destroy

    render json: {alert: "Movie was deleted."}
  end

  private

  def the_movie_exists?
    params[:id] && Movie.exists?(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :year, :synopsis)
  end

end
