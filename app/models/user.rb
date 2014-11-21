class User < ActiveRecord::Base

  has_many :attenders
  has_many :reservation, through: :attenders
end
