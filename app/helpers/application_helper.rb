module ApplicationHelper

  def all_clubs_helper
    Club.all
  end

  def headline_icon(page_name)
    if page_name == 'users'
      'user'
    else
      'inbox'
    end
  end

end
