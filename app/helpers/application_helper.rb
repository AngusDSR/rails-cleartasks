module ApplicationHelper
  def calculate_time_difference(start_time, end_time)
    difference_in_seconds = (end_time - start_time).to_i
    days = difference_in_seconds / (24 * 60 * 60)
    remaining_seconds = difference_in_seconds % (24 * 60 * 60)
    hours = remaining_seconds / (60 * 60)
    minutes = (remaining_seconds % (60 * 60)) / 60

    { days:, hours:, minutes: }
  end
end
