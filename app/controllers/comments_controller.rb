class CommentsController < ApplicationController
  before_action :require_user
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params.require(:comment).permit(:body))
    @comment.user = current_user
    
    if @comment.save
      flash[:notice] = "Your comment has been saved. Thanks!"
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end
  
  def vote
    comment = Comment.find(params[:id])
    vote  = Vote.create(voteable: comment, user: current_user, vote: params[:vote])
    
    if vote.valid?
      flash[:notice] = "Your vote was counted. Thanks!"
    else
      flash[:error] = "You can only vote on a comment once."
    end
    
    redirect_to :back
  end
end



# class CommentsController < ApplicationController
# before_action :require_user #require_user is application-wide & is a redirect if not logged in

# def create # there is no new because the comment is based on an existing post
#	@post = Post.find(params[:post_id])
#	@comment = @post.comments.build(params.require(:comment).permit(:body))
#	@comment.user = current_user # associate current user with the comment
	#alternative syntax to link a comment to a post -- @comment.post = @post
 
#		if @comment.save
#		flash[:notice] = "Your comment has been saved. Thanks!"
#		redirect_to post_path(@post)
 
#	else
#	render 'posts/show'
#	end
# end


# def vote
# comment = Comment.find(params[:id])
# vote = Vote.create(voteable: comment, username: current_user, vote: params[:vote])

# if vote.valid?
# flash[:notice]="Your vote was counted."
# else
# flash[:error]="You can only vote once."
# end
# redirect_to :back
# end


# end