class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		# debugger
	end

  def new
  	@user = User.new
  end

  def create
  	
  	@user = User.new(user_params)
		#@user = User.new(params[:user]) # Not the final implementation!
		if @user.save
			log_in @user
			flash[:success] = "Welcome to the Sample App!"
			redirect_to @user
			# Handle a successful save.
		else
			render 'new', status: 400
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:success] = "Profile updated"
			redirect_to @user
			# Handle a successful update.
		else
			render 'edit',  status: 400
		end
	end

	private
		def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

end
