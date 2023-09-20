class MoviesController < ApplicationController
  # Show all data on movies' page
  def index
    # this create N + 1 problem
    # +1 refers to movies whereas N refers to production_companies
    # in short this means we are reduntantly calling the databse which can be expensive :)
    # @movies = Movie.all
    @movies = Movie.includes(:production_company).all.order('average_vote DESC')
  end

  # show single data on each movie's page
  def show
    @movie = Movie.find(params[:id])
  end
end
