module ApplicationHelper
  def fix_url(str)
    str.starts_with?("http://") ? str: "http://#{str}" 
  end

  def display_datetime(dt)
    dt.strftime("%m/%d/%Y %l:%M%P %Z") #date time format will be: MM/DD/YYYY
  end

end
