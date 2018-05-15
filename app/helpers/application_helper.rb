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

  def all_provinces
    @all_provinces ||= Province.all
  end

  def current_province
    if session and session[:province_id]
      @current_province ||= Province.find(session[:province_id])
    else
      @current_province = Province.first
    end
  end

  def set_current_province(province)
    if session
      session[:province_id] = province.id
      @current_province = nil
    end
    return !session.nil?
  end

end
