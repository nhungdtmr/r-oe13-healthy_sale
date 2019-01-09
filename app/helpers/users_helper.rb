module UsersHelper
  def start_year
    return Date.today.year - Settings.value.start_date
  end

  def end_year
    return Date.today.year - Settings.value.end_date
  end
end
