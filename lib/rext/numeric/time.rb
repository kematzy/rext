
class Numeric
  
  def seconds; self            end
  def minutes; self * 60       end
  def hours;   self * 3600     end
  def days;    self * 86400    end
  def weeks;   self * 604800   end
  def months;  self * 2592000  end
  def years;   self * 31471200 end

  alias :second :seconds
  alias :minute :minutes
  alias :hour :hours
  alias :day :days
  alias :week :weeks
  alias :month :months
  alias :year :years

  def to_minutes; self / 1.minute end
  def to_hours;   self / 1.hour   end
  def to_days;    self / 1.day    end
  def to_weeks;   self / 1.week   end
  def to_months;  self / 1.month  end
  def to_years;   self / 1.year   end

  ##
  # Time before specified +time+, which defaults to now.
  #
  # === Examples
  #
  #   event = 10.days.ago
  #   15.minutes.before event
  #

  def ago time = ::Time.now
    time - self
  end
  alias :before :ago

  ##
  # Time since specified +time+, which defaults to now.
  #
  # === Examples
  #
  #   event = 1.year.ago
  #   3.months.since event
  # 
  #   4.days.from_now
  #

  def since time = ::Time.now
    time + self
  end
  alias :from_now :since
  
end