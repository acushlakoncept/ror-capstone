module ApplicationHelper
  def active_class(url_action)
    'active' if params[:action] == url_action
  end
end
