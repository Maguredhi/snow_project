module UsersHelper
  def avatar(user, w: 300, h: 200)
    image_tag user.avatar.variant(resize_to_fit: [w, h]) if user.avatar.attached?
  end
end
