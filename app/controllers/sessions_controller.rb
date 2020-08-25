class SessionsController < ApplicationController
    def new; end
  
    def create
      @user = User.find_by(username: params[:session][:user])
  
      if @user
        session[:username] = @user.username
        redirect_to root_path
      else
        flash.now[:danger] = 'Something wrong with the login information'
        render 'new'
      end
    end
  
    def destroy
      session[:username] = nil
      flash[:success] = 'You have successfully logged out'
      redirect_to login_path
    end
  end
  