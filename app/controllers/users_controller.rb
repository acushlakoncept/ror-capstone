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
  end

  def destroy
  end


  private

  def sign_up_params
    params.require(:user).permit(:username, :fullname)
  end
end
