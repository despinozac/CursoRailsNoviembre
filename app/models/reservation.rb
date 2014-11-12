class Reservation < ActiveRecord::Base

  belongs_to :room

  def max_people
    room.max_people
  end

  def empty_spaces
    max_people - people_number
  end
end
