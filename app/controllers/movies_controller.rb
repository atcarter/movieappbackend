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
      message = "Movie not found."
      render json: {error: message}
    end
  end

  private

  def the_movie_exists?
    params[:id] && Movie.exists?(params[:id])
  end

end
