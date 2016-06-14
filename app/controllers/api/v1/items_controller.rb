class Api::V1::ItemsController < Api::ApiController
  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id])
  end

  def destroy
    Item.destroy(params[:id])
    unless Item.exists?(params[:id])
      respond_with status: 204
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      respond_with @item
    end
  end

private

  def item_params
    params.permit(:name, :description, :image_url)
  end

end
