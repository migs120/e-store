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
  
  def update
    Item.find(params[:id]).update_attributes(title: params[:item][:title] ,body: params[:item][:body] )
    redirect_to main_category_item_path(Item.find(params[:id]).main_category_id, Item.find(params[:id]).id )
  end

  def destroy
    if Item.find(params[:id]).destroy
    flash[:notice] = 'An Item was destoryed'
    end
    redirect_to root_path
  end  
  
  
  
end
