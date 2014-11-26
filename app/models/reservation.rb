class Reservation < ActiveRecord::Base

  has_many :attenders
  has_many :students, through: :attenders, class_name: 'User', foreign_key: 'user_id'
  belongs_to :room

  validates :people_number, :from, presence: true 
  
  validate :check_capacity, :check_hours, :check_availability

  def max_people
    room.max_people
  end

  def empty_spaces
    max_people - people_number
  end

  private

  def check_capacity
    if people_number > max_people
      errors.add(:people_number, "Excede la capacidad de la sala")
    end
  end

  def check_hours
    if from >= to
      errors.add(:from, "La hora de inicio debe ser mayor estricto que la hora de finalizacion")
    end
  end

  def check_availability
    checks_reservations = Reservation.where("reservation_date = ? and room_id = ?", reservation_date, room_id)

    checks_reservations.each do |reservation|
      if from.between?(reservation.from, reservation.to - 1)
        errors.add(:from, "Solapa un horario previo")
        break
      elsif to.between?(reservation.from + 1, reservation.to)
        errros.add(:to, "Solapa un horario previo")
        break
      elsif ( (from..to).include?(reservation.from..reservation.to) )
        errors.add(:general, "Solapa un horario previo")
        break
      else
        "Nothing to do"
      end
    end

  end
end
