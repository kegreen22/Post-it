class UsersController < ApplicationController
# before_action :require_same, only: [:show, :edit, :update]
before_action :set_user, only: [:show, :edit, :update]
before_action :require_same, only: [:edit, :update]

def new
@user = User.new
end
 
def create
@user = User.new(user_params)
 
if @user.save
flash[:notice] = "Your information has been saved. Welcome!"
session[:user_id] = @user.id
# now automatically log user into the site after their registration
redirect_to root_path
else
render :new
end
end
 

def edit
# @user = User.find(params[:id])
end

def show
# @user = User.find(params[:id])
end

 
def update
if @user.update(user_params)
flash[:notice] = "Your profile has been updated." 
redirect_to user_path(@user)
else
render :update
end
end
 
 
 

def user_params # allow whitelist through
params.require(:user).permit(:username, :password)
end
 
def set_user
@user = User.find_by(slug: params[:id])
end

end # the end of the controller