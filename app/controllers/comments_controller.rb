class CommentsController < ApplicationController
before_action :require_user, except: [:index, :show] #require_user is application-wide & is a redirect if not logged in

def create # there is no new because the comment is based on an existing post
	@post = Post.find(params[:post_id])
	@comment = @post.comments.build(params.require(:comment).permit(:body))
	@comment.user = current_user # associate current user with the comment
	#alternative syntax to link a comment to a post -- @comment.post = @post
 
		if @comment.save
		flash[:notice] = "Your comment has been saved. Thanks!"
		redirect_to post_path(@post)
 
	else
	render 'posts/show'
		end
end

def vote
commment = Comment.find(params[:id])
Vote.create(voteable: comment, user: current_user, vote: params[:vote])
flash[:notice] = "Your vote was counted"
redirect_to :back
end

end