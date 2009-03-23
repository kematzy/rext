
class Date
  
  ##
  # Convert Date to a Time instance.
  #
  
  def to_time
    Time.utc year, month, day
  end
  
end