class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  before_action :not_logged_in,  only: [:new, :create]

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
  	@user = User.find(params[:id]) 
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      log_in @user
      flash[:success] = "Welcome to AGNI KAI!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted. :( R.I.P"
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    # Before filters

    def not_logged_in
      if logged_in?
        flash[:notice] = "You must log out to preform this action."
        redirect_to(root_url)
      end
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless  current_user?(@user) || admin_user?;
    end

end
