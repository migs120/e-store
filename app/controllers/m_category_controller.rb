class MCategoryController < ApplicationController
  def index
  end

  def show
  end

  def new
  end
  
   def create
    MCategory.create(title: params[:m_category][:title] ,body: params[:m_category][:body])
    redirect_to root_path
  end

  def edit
  end
  
  def update
    MCategory.find(params[:id]).update_attributes(title: params[:m_category][:title] ,body: params[:m_category][:body] )
    redirect_to m_category_path(params[:id])
  end
end
