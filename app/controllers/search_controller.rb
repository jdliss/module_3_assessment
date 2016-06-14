class SearchController < ApplicationController
  def index
    @total = Store.total(params[:search])
    @stores = Store.find(params[:search])
  end
end
