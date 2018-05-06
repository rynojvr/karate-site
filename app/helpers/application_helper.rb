module ApplicationHelper

  def all_clubs_helper
    Club.all.order(:name)
  end

  def headline_icon(page_name)
    if page_name == 'users'
      'user'
    else
      'inbox'
    end
  end

end
