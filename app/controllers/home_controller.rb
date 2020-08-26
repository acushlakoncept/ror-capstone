class HomeController < ApplicationController
    before_action :require_user
    def index
        @opinion = Opinion.new
        @opinions = Opinion.all
    end
end
