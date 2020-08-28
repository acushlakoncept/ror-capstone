module ApplicationHelper
  def active_class(url_action)
    'active' if params[:action] == url_action
  end

  def show_cover_image(user)
    if user.cover_image.present?
      image_tag("#{user.cover_image}", alt: user.username, class: 'pr-2') 
    else
      image_tag('https://source.unsplash.com/random/800x250', alt: user.username, class: 'pr-2') 
    end
  end
end


