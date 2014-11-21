class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.includes(:room).all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(params_permit)

    if @reservation.save
      redirect_to reservations_path, notice: "Su reserva fue creada exitosamente"
    else
      render 'new'
    end
  end

  private

  def params_permit
    params.require(:reservation).permit(:reservation_date, :from, :to, :description, :room_id, :people_number)
  end
end
