class LikesController < ApplicationController
    def create
        @like = current_user.likes.new(opinion_id: params[:opinion_id])

        if @like.save
        redirect_back(fallback_location: root_path)
        flash[:notice] = 'You like an opinion'
        else
        redirect_back(fallback_location: root_path)
        flash[:alert] = 'You cannot like this opinion'
        end
    end

    def destroy
        like = Like.find_by(id: params[:id], user: current_user, opinion_id: params[:opinion_id])
        if like
        like.destroy
        redirect_back(fallback_location: root_path)
        flash[:notice] = 'You disliked an opinion'
        else
        redirect_back(fallback_location: root_path)
        flash[:alert] = 'You can\'t disliked an opinion that you did not like before.'
        end
    end
end