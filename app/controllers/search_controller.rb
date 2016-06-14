class SearchController < ApplicationController
  def index
    Store.find(params[:search])
  end
end
