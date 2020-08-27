module UsersHelper
    def follow_btn(obj)
        return unless current_user.id != obj.id
    
        return if current_user.friend?(obj)
    
        out = ''
        if current_user.pending_friends.include?(obj)
          out << link_to('pending friendship', '#')
        elsif current_user.friend_requests.include?(obj)
          out << link_to('Accept', invite_path(user_id: obj.id), method: :put)
          out << ' | '
          out << link_to('Reject', reject_path(user_id: obj.id), method: :delete)
        else
          out << link_to('Invite to friendship', invite_path(user_id: obj.id), method: :post)
        end
    
        out.html_safe
      end

    def display_follow_btn(user, the_partial)
       return if current_user == user || current_user.follows.include?(user)
     
       render partial: the_partial, locals: {obj: user}
    end

    def display_follower_count(obj)
      return 'No Followers'.html_safe unless obj.followers.count > 0

      out = ''
      out << 'Followed by ' 
      out << link_to(obj.followers.first.fullname, profile_path(obj.followers.first.username))
      out.html_safe
    end
end