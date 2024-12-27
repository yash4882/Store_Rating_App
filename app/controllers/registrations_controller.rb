class RegistrationsController < ApplicationController
	def new
		@user = User.new
	end

	def create
		params[:user][:role] = params[:user][:role]
		@user = User.new(registration_params)
		if @user.save
			login @user   #login method for logged the user in
			redirect_to root_path, notice: "Sign up successfully"
		else
			render :new, status: :unprocessable_entity
		end
	end

	private

	def registration_params
		params.require(:user).permit(:name, :email, :address, :password, :password_confirmation, :role)
	end
end