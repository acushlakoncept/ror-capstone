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

  def show_photo(user, extra_class='')
    if user.photo.present?
      image_tag("#{user.photo}", alt: user.username, class: "pr-2 rounded-circle profile-img #{extra_class}") 
    else
      image_tag('https://source.unsplash.com/random/60x60', alt: user.username, class: 'pr-2 rounded-circle profile-img') 
    end
  end

end
