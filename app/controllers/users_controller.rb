Create class UsersController < ApllicationController
def new
@user = User.new
end
 
def create
@user = User.new(user_params)
 
if @user.save
flash [:notice] = "Your information has been saved. Welcome!"
redirect_to root_path
else
render :new
end
end
 
 
def update
@user = User. (:id)
 
if @user.update
 
else
render :update
 
end
 
end
 
 
 
private
def user_params # allow whitelist through
params.require(:user).permit(:username, :password)
end
 
end # the end of the controller