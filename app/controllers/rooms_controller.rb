class RoomsController < ApplicationController

  def index
   @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params_permit)

    if @room.save
      redirect_to rooms_path, notice: "El room fue creado correctamente"
    else
      render 'new'
    end 
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])

    if @room.update(params_permit)
      redirect_to rooms_path
    else
      render 'edit'
    end  
  end
  def destroy
    @room = Room.find(params[:id])

    if @room.destroy
      redirect_to rooms_path
    else
      redirect_to room_path(room)
    end
  end

  def top
    @rooms = Room.joins(:reservations).select("name, count(name) as cuenta")
      .group("name").order("cuenta desc")
  end

  private

  def params_permit
    params.require(:room).permit(:name,:description, :location, :max_people)
  end
end
