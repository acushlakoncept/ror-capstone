module ApplicationHelper
  def active_class(url_action)
    'actived' if params[:action] == url_action
  end

  def show_cover_image(user)
    if user.cover_image.present?
      image_tag(user.cover_image.to_s, alt: user.username, class: 'pr-2')
    else
      image_tag('https://source.unsplash.com/random/800x250', alt: user.username, class: 'pr-2')
    end
  end

  def show_photo(user, extra_class = '')
    if user.photo.present?
      image_tag(user.photo.to_s, alt: user.username, class: "pr-2 rounded-circle profile-img #{extra_class}")
    else
      image_tag('https://source.unsplash.com/random/60x60',
                alt: user.username, class: 'pr-2 rounded-circle profile-img')
    end
  end

  def display_settings_btn(user, the_partial)
    render partial: the_partial, locals: { obj: user } if logged_in?
  end

  def auth_rendered_partial(the_partial)
    render partial: the_partial if logged_in?
  end

  def show_right_aside
    if logged_in? && params[:action] == 'index'
      render partial: 'shared/right-side'
    elsif params[:action] == 'show'
      render partial: 'shared/profile'
    end
  end

  def like_or_dislike_btn(opinion)
    like = Like.find_by(opinion_id: opinion.id, user_id: current_user.id)
    if like
      link_to('Dislike!', like_path(id: like.id, opinion_id: opinion.id), method: :delete)
    else
      link_to('Like!', likes_path(opinion_id: opinion.id), method: :post)
    end
  end
end
