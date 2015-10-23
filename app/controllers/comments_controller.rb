class CommentsController < ApplicationController
	def create
	  @post = Post.find(params[:post_id])
	  @comment = @post.comments.create!(:user_id => current_user.id,:content => params[:comment][:content])
	  
	  respond_to do |format|
	  	format.html { redirect_to @post, :notice => "Comment created!" }
	  	format.js  # render comments/create.js.rb
	  end
	end


	 private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:name, :content)
    end
end
