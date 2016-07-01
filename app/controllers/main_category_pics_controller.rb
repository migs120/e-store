class MainCategoryPicsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end
  
  def create
    MainCategoryPic.create(pic_url: params[:main_category_pic][:pic_url], main_category_id: params[:main_category_id] )
    redirect_to root_path
  end

  def edit
  end
  
  def update
    MainCategoryPic.find(params[:id]).update_attributes(pic_url: params[:main_category_pic][:pic_url] )
    redirect_to main_category_path(MainCategoryPic.find(params[:id]).main_category_id )
  end
  
end
