class HotelsController < ApplicationController
  before_action :load_hotels, only: [:checkin, :checkout, :available_rooms, :find_vehicle, :show]
  skip_before_action :verify_authenticity_token

  def create
    hotel = Services::Hotel.new(hotel_params).create
    render json: "Created a Hotel with #{ hotel.rooms.size } rooms"
  end

  def index
  end

  # Checkin to room
  def checkin
    status = @hotel.checkin(hotel_room_params)
    if status == :success
      render json: 'Checked into room successfully '
    else
      render json: 'Rooms not availble', status: :unprocessable_entity
    end
  end

  # Checkout from room
  def checkout
    @hotel.checkout(hotel_room_params)
    render json: 'Checked out room successfully'
  end

  def available_rooms
    render json: @hotel.available_rooms
  end

  def show
    render json: @hotel
  end

  def find_vehicle
    render json: @hotel.find_vehicle(params['vehicle_number'])
  end

  private

  def hotel_params
    params.require(:hotel).permit(:number_of_rooms)
  end

  def hotel_room_params
    params
      .require(:hotel_room)
      .permit(:room_id, :user_id)
  end

  def load_hotels
    redis = Redis.new(host: 'localhost')
    @hotel = Marshal.load(redis.get('hotels'))
  end
end
