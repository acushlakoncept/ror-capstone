class HomeController < ApplicationController
    before_action :require_user
    def index
        @opinion = Opinion.new
        @opinions = Opinion.ordered_by_most_recent
    end
end
