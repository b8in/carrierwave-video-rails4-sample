class MoviesController < ApplicationController
  def index
    @movie = Movie.new
    @movies = Movie.all
  end

  def create
    @movie = Movie.create(movie_params)
    redirect_to :back
  end

  private
  def movie_params
    params.require(:movie).permit!
  end
end
