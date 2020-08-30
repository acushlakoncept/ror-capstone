class FollowingsController < ApplicationController
  def create
    @following = current_user.followings.new(followed_id: params[:user_id])
    flash[:notice] = if @following.save
                       "You are now following #{User.find(params[:user_id]).fullname}"
                     else
                       'Something went wrong.'
                     end
    redirect_back(fallback_location: root_path)
  end
end
