class UsersController < ApplicationController
  before_action :require_user, except: %i[new create]

  def new
    @user = User.new
    redirect_to root_path if logged_in?
  end

  def create
    @user = User.new(sign_up_params)
    @user.username = @user.username.downcase
    if @user.save
      flash[:notice] = 'Account was created successfully'
      session[:username] = @user.username
      redirect_to root_path
    else
      flash[:alert] = 'Something went wrong'
      render new_user_path
    end
  end

  def show
    @user = User.find_by(username: params[:username])
    @opinion = Opinion.new
    @opinions = @user.opinions.ordered_by_most_recent
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(sign_up_params)

    flash.notice = 'Your profile has been updated!'

    redirect_to profile_path(@user.username)
  end

  private

  def sign_up_params
    params.require(:user).permit(:username, :fullname, :photo, :cover_image)
  end
end
