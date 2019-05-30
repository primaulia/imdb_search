class MoviesController < ApplicationController
  def index
    if params[:query].present?
      # pure postgres operator method

      # sql_query = " \
      #   movies.title @@ :query \
      #   OR movies.syllabus @@ :query \
      #   OR directors.first_name @@ :query \
      #   OR directors.last_name @@ :query \
      # "
      # @movies = Movie.joins(:director).where(sql_query, query: "%#{params[:query]}%")

      # pgSearch
      @movies = Movie.global_search(params[:query])
    else
      @movies = Movie.all
    end
  end
end
