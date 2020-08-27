class FollowingsController < ApplicationController
    def create
        @following = current_user.followings.new(followed_id: params[:user_id])
        if @following.save
          flash[:notice] = "You are now following #{User.find(params[:user_id]).fullname}"
          redirect_back(fallback_location: root_path)
        else
          flash[:notice] = 'Something went wrong.'
          redirect_back(fallback_location: root_path)
        end
    end
end
