class UsersController < ApplicationController
	before_filter :authenticate, :only => [:edit, :update, :index]
	before_filter :correct_user, :only => [:edit, :update]
	
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			sign_in @user
			flash[:success] = "Successfully created user."
			redirect_to @user
		else
			@title = "Sign up"
			render 'new'
		end
	end

	def edit
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
			flash[:success] = "Successfully updated user."
			redirect_to @user
		else
			render :action => 'edit'
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		flash[:notice] = "Successfully destroyed user."
		redirect_to users_url
	end
	
	private
	
		def authenticate
			deny_access unless signed_in?
		end
		
		def correct_user
			@user = User.find(params[:id])
			redirect_to(root_path) unless current_user?(@user)
		end
end
