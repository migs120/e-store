class ItemPicsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end
  
  def create
    
    Item.find(params[:item_id]).item_pics.create(params.require(:item_pic).permit(:pic_url))
    redirect_to main_category_item_path(params[:main_category_id], params[:item_id])
  end  

  def edit
  end
  
  def update
   
    ItemPic.find(params[:id]).update_attributes(params.require(:item_pic).permit(:pic_url) )
    redirect_to main_category_item_path(params[:main_category_id], params[:item_id] )
  end  
  
  def destroy
    if ItemPic.find(params[:id]).destroy
    flash[:notice] = 'A Picture was destoryed'
    end
    redirect_to main_category_item_path(params[:main_category_id], params[:item_id])
  end  
  
end
