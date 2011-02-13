module UsersHelper

  def github(user)
    return "" if !user.github
    github = image_tag('icons/github_16x16.png')
    github << " " 
    github << link_to(user.github, "http://github.com/#{user.github}")
  end

  def twitter(user)
    return "" if !user.twitter
    twitter = image_tag('icons/twitter_16x16.png')
    twitter << " "
    twitter << link_to("@#{user.twitter}", "http://twitter.com/#{user.twitter}")
  end

end
