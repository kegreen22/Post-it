class CategoriesController < ApplicationController
# has all actions except destroy
before_action :require_user, except: [:new, :create] #require_user is application-wide & is a redirect if not logged in

	def index
	@categories = Category.all
	end

	def new
	@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save
		flash[:notice] = "Your new category has been created. Thanks!"
		redirect_to categories_path
		else
			render :new
		end
	end

	def show
		@category = Category.find_by(slug: params[:id])
	end


	def update
		@category = Category.find(params[:id])
		if @category.update(category_params)
		flash[:notice] = "Your category has been updated. Thanks!"
		redirect_to categories_path
		else
		render :edit
		end

	end

def category_params
params.require(:category).permit(:name)
end


end
