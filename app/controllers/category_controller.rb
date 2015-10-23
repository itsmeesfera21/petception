class CategoryController < ApplicationController

  # GET /caegory
  # GET /posts.json
  def index
     @posts = if params[:id]
               Post.where(category_id: params[:id])
             else
               Post.all
             end
  
  end

end
