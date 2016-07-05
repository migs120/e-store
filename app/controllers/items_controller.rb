class ItemsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end
  
  def create
    @item = Item.create(title: params[:item][:title] ,body: params[:item][:body], main_category_id: params[:main_category_id])
    @item_id = @item.id
    redirect_to main_category_item_path(@item.main_category_id,@item.id)
  end

  def edit
  end
end
