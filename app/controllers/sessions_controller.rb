class SessionsController < ApplicationController

	def new
	end

	def create
		@user = User.find_by(email: params[:session][:email])

		if @user && @user.authenticate(params[:session][:password])
			session[:user_id] = @user.id
			redirect_to user_path(@user), notice: "You have successfully logged in!"
		else
			flash[:error] = "Invalid username or password"
			render 'new'
		end
	end
end