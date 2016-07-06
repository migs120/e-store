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
  
  def update
    ItemPic.find(params[:id]).update_attributes(pic_url: params[:item_pic][:pic_url] )
    redirect_to main_category_item_path(params[:main_category_id], params[:item_id] )
  end  
  
  def destroy
    if ItemPic.find(params[:id]).destroy
    flash[:notice] = 'A Picture was destoryed'
    end
    redirect_to main_category_item_path(params[:main_category_id], params[:item_id])
  end  
  
end
