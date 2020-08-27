module UsersHelper
  def display_follow_btn(user, the_partial)
    return if current_user == user || current_user.follows.include?(user)

    render partial: the_partial, locals: { obj: user }
  end

  def display_follower_count(obj)
    return 'No Followers'.html_safe unless obj.followers.count.positive?

    out = ''
    out << 'Followed by '
    out << link_to(obj.followers.first.fullname, profile_path(obj.followers.first.username))
    out.html_safe
  end
end
