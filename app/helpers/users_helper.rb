module UsersHelper
  def sign_up user
    session[:user_id] = user.id  	
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by id: session[:user_id]
    end
  end

  def logged_in?
    current_user.present?
  end

  def start_year
    return Date.today.year - Settings.value.start_date
  end

  def end_year
    return Date.today.year - Settings.value.end_date
  end
end
