class UsersController < ApplicationController
	before_filter :authenticate, :except => [:show, :new, :create]
	
	def index
		@users = User.paginate(:page => params[:page])
		@title = "All users"
	end
	
  def new
    @user = User.new
		@title = "Sign up"
  end
	
	def show
    @user = User.find(params[:id])
		@title = @user.name
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to DJs Best Friend!"
      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
			@user.password.clear
			@user.password_confirmation.clear
    end
  end
end
