class OpinionsController < ApplicationController
    before_action :require_user

    def create
        @opinion =  current_user.opinions.build(opinion_params)
        if @opinion.save
            flash.now[:notice] = 'Opinion was created successfully'
            redirect_to root_path
        else
            flash.now[:alert] = 'Something went wrong'
        end
    end

    private

    def opinion_params
        params.require(:opinion).permit(:text)
    end

end
