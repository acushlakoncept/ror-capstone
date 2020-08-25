class UsersController < ApplicationController
  def new
    @user = User.new
    #TODO: redirect to root path if logged in
  end

  def create
    @user = User.new(sign_up_params)
    if @user.save
      flash[:notice] = 'Account was created successfully'
      session[:username] = @user.username
      redirect_to root_path
    else
      flash[:alert] = 'Something went wrong'
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    session[:username] = nil
    flash[:success] = 'You have successfully logged out'
    redirect_to new_user_path
  end


  private

  def sign_up_params
    params.require(:user).permit(:username, :fullname)
  end
end
