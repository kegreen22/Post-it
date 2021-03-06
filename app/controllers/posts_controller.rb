class PostsController < ApplicationController
before_action :require_user, except: [:show, :index] #require_user is application-wide & is a redirect if not logged in
before_action :set_post, only: [:show, :edit, :update, :vote]
before_action :require_admin, only: [:edit]

  def index
  	@posts = Post.all.sort_by{|x| x.total_votes}.reverse
    # show all posts
  end

  
def new
   @post = Post.new  # new Post form
end

def create
   @post = Post.new(post_params)
   @post.user = current_user
   if @post.save
   flash[:notice] = "Your Post has been created. Thanks!"
   redirect_to posts_path
   # Render new template again if database save fails (an error)
   else
   render :new
  end
end


def show
  	# @post = Post.find(params[:id])  # shown post
    @comment = Comment.new #ability to create new comment
end
 
def edit
  # @post = Post.find(params[:id])
end

def update
  #  @post = Post.find(params[:id])
   if @post.update(post_params)
   flash[:notice] = "Your Post has been updated. Thanks!"
   redirect_to posts_path(@post)
   # Render edit template again if database save fails (an error)
   else
   render :edit
   end
 end

def vote
@vote = Vote.create(voteable: @post, user: current_user, vote: params[:vote])
 
respond_to do |format|
format.html do
if @vote.valid?
flash[:notice] = "Your vote has been counted."
else
flash[:error]="You can only vote once."
end
redirect_to :back
end
format.js  #ajax code
end
end


 

def post_params
   params.require(:post).permit(:title, :url, :description, category_ids: [])
   # params.require(:post).permit!
end

def set_post
    #@post = Post.find(params[:id])
    @post = Post.find_by(slug: params[:id])
  end

end
