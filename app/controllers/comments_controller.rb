class CommentsController < ApplicationController

def create # there is no new because the comment is based on an existing post
	@post = Post.find(params[:post_id])
	@comment = @post.comments.build(params.require(:comment).permit(:body))
	@comment.user = User.first # just to have a user associated with the comment
	#alternative syntax to link a comment to a post -- @comment.post = @post
 
		if @comment.save
		flash[:notice] = "Your comment has been saved. Thanks!"
		redirect_to post_path(@post)
 
	else
	render 'posts/show'
		end
end

end