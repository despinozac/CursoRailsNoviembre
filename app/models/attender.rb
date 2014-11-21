class Attender < ActiveRecord::Base

  belongs_to :reservation
  belongs_to :student, class_name: 'User', foreign_key: 'user_id'
end
