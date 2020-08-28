class HomeController < ApplicationController
  before_action :require_user
  def index
    @opinion = Opinion.new
    @opinions = Opinion.includes(:author).ordered_by_most_recent
    @not_following = current_user.not_following
  end
end
