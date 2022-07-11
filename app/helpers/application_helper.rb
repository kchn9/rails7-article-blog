module ApplicationHelper
  def random_avatar_for_user(user, options = { size: 200 })
    src = "https://i.pravatar.cc/#{options[:size]}"
    image_tag(src, alt: user.username, class: "rounded shadow mx-auto d-block")
  end
end
