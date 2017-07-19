module PostsHelper
  def user_is_authorized_to_delete_posts?(post)
       current_user && (current_user == post.user || current_user.admin?)
  end
  def user_is_authorized_to_edit_posts?(post)
       current_user && ( current_user == post.user || current_user.admin? || current_user.moderator? )
  end
  def user_is_authorized_to_create_posts?(post)
       current_user && ( current_user == post.user || current_user.admin? || current_user.moderator? )
  end
end
