require 'date'

class Shift < ApplicationRecord
  belongs_to :user, foreign_key: :user_id

  def date
    if start
      date = start.to_date
    end
    date
  end

  def start_time
    if start
      start_time = start.strftime("%I:%M %p")
    end
    start_time
  end

  def finish_time
    if finish
      finish_time = finish.strftime("%I:%M %p")
    end
    finish_time
  end

  def hours_worked
    if start
      hours_worked = ((finish - start)/3600.0 - break_length/60.0).round(3)
    end
    hours_worked
  end

  def shift_cost
    if user
      shift_cost = hours_worked * user.organisation.hourly_rate
    end
    shift_cost
  end



end
