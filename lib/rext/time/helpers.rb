
class Time
  
  def to_time #:nodoc:
    self
  end
  
  ##
  # Time in words since +time+ or now.
  #
  # === Examples
  #
  #   5.seconds.ago.in_words_since_now  # => less than one minute
  #   5.days.ago.in_words_since_now     # => 5 days
  #   1.month.ago.in_words_since_now    # => 1 month
  #   101.years.ago.in_words_since_now  # => hundreds of years
  #
  #   "the article was published #{article.created_at.in_words_since_now} ago"  
  #   # => the article was published 15 minutes ago
  #

  def in_words_since time = Time.now
    return if self > time
    seconds = (time - self).to_i
    pluralize = lambda { |string| n = seconds.send(:"to_#{string}s"); n == 1 ? "one #{string}" : "#{n} #{string}s" }
    case seconds
    when 0..59                ; 'less than one minute'
    when 1.minute..59.minutes ; pluralize[:minute]
    when 1.hour..23.hours     ; pluralize[:hour]
    when 1.day..6.days        ; pluralize[:day]
    when 1.week..3.weeks      ; pluralize[:week]
    when 1.month..11.months   ; pluralize[:month]
    when 1.year..99.years     ; pluralize[:year]
    else 'hundreds of years'
    end
  end
  alias :in_words_since_now :in_words_since
  
end