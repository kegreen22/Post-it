class UsersController < ApplicationController
def new
@user = User.new
end
 
def create
@user = User.new(user_params)
 
if @user.save
flash[:notice] = "Your information has been saved. Welcome!"
redirect_to root_path
else
render :new
end
end
 
 
def update
@user = User.find(params[:id])
 
if @user.update(user_params)
flash[:notice] = "Your profile has been updated." 
# now automatically log user into the sit after their registration
session[:user_id] = @user.id
redirect_to root_path
else
render :update
 
end
end
 
 
 
private
def user_params # allow whitelist through
params.require(:user).permit(:username, :password)
end
 
end # the end of the controller