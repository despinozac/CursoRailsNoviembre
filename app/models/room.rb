class Room < ActiveRecord::Base

  has_many :reservations, dependent: :destroy #destroy o nullify

  validates :max_people, presence: true, 
    numericality: {greater_than: 0, less_thanan: 11, only_integer: true, message: "El salon debe tener entre 1 y 10 estudiantes"}

  def self.max_capacity
    select(:max_people).order('max_people DESC').first.max_people    
  end  
end
