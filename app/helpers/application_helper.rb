module ApplicationHelper

  def all_clubs_helper
    Club.all
  end

  def current_club
    @current_club ||= Club.find(session[:club_id]) if session[:club_id]
    @current_club ||= Club.first
  end

end
