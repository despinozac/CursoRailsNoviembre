class RoomsController < ApplicationController

  def index
   @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params_permit)

    if @room.save
      redirect_to rooms_path
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
  end

  private

  def params_permit
    params.require(:room).permit(:name,:description, :location, :max_people)
  end
end
