class ItemPicsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end
  
  def create
    ItemPic.create(pic_url: params[:item_pic][:pic_url], item_id: params[:item_id] )
    redirect_to main_category_item_path(params[:main_category_id], params[:item_id])
  end  

  def edit
  end
end
