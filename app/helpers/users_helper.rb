module UsersHelper
  def avatar_url(user)
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "https://gravatar.com/avatar/#{gravatar_id}.png?s=42"
  end

  def detects_posts_comments(user)
    if user.posts == nil and user.comments == nil then
      false
    else
      true
    end
  end
end
