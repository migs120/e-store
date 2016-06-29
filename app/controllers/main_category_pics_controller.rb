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
end
