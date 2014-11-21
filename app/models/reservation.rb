class Reservation < ActiveRecord::Base

  has_many :attenders
  has_many :students, through: :attenders, class_name: 'User', foreign_key: 'user_id'
  belongs_to :room

  def max_people
    room.max_people
  end

  def empty_spaces
    max_people - people_number
  end
end
