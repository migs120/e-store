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
end
