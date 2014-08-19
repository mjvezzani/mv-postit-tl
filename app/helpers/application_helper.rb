module ApplicationHelper

  def fix_url(str)
    str.starts_with?('http://') ? str : "http://#{str}"
  end

  def prettify_datetime(date)
    date.strftime("%b %l %Y")
  end

end
