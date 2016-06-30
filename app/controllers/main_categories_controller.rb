class MainCategoriesController < ApplicationController
 
  def index
    
  end

  def show
    
  end
  
  def create
    MainCategory.create(title: params[:main_category][:title] ,body: params[:main_category][:body])
    redirect_to main_categories_path
  end

  def new
    
  end
  

  def edit
    
  end
  
  def update
    MainCategory.find(params[:id]).update_attributes(title: params[:main_category][:title] ,body: params[:main_category][:body] )
    redirect_to main_category_path(params[:id])
  end
  
  def destroy
    if MainCategory.find(params[:id]).destroy
    flash[:notice] = 'A Category was destoryed'
    end
    redirect_to root_path
  end
  
  
  
end
