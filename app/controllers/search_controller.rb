class SearchController < ApplicationController
  def index
    @stores = Store.find(params[:search])
  end
end
