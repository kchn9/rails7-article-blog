module ApplicationHelper
  def random_avatar_for_user(user, options = { size: 200 })
    src = "https://i.pravatar.cc/#{options[:size]}"
    image_tag(src, alt: user.username, class: "rounded shadow mx-auto d-block")
  end

  def get_random_article_background_image
    "https://source.unsplash.com/random/?article"
  end
end
