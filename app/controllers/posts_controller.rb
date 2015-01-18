class PostsController < ApplicationController
  def index
  	@posts = Post.all 
    # show all posts
  end

  
def new
   @post = Post.new  # new Post form
end

def create
   @post = Post.new(post_params)
   if @post.save
   flash[:notice] = "Your Post has been created. Thanks!"
   redirect_to posts_path
   # Render new template again if database save fails (an error)
   else
   render :new
  end
end


def show
  	@post = Post.find(params[:id])
    @comment = Comment.new
end
 
def edit
   @post = Post.find(params[:id])
end

def update
   @post = Post.find(params[:id])
   if @post.update(post_params)
   flash[:notice] = "Your Post has been updated. Thanks!"
   redirect_to posts_path
   # Render edit template again if database save fails (an error)
   else
   render :edit
   end
end

 
def post_params
   params.require(:post).permit!
end

end
