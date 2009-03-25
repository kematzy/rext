
class Date
  
  ##
  # Convert Date to a Time instance.
  
  def to_time form = :utc
    Time.send form, year, month, day
  end
  
end