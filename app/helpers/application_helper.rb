module ApplicationHelper
    def set_active_class(url_action)
        'active' if params[:action] == url_action
    end
end
