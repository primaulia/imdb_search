class PagesController < ApplicationController
  def home
    if params[:query].present?
      # multi search method
      @results = PgSearch.multisearch(params[:query])

      # raise
    end
  end
end
