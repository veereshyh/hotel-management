module Services
  class Hotel

    ROOM_FULL_MESSAGE = 'Sorry, no rooms available'.freeze

    attr_accessor :rooms

    def initialize(params)
      @rooms = []
      number_of_rooms = params["number_of_rooms"]
      number_of_rooms.to_i.times do |index|
        room_number = index + 1
        rooms[index] = Room.new(room_number)
      end
    end

    def create
      update_store
      self
    end

    def checkin(params)
      # Todo add rescue if its get failed to checkin
      # Add validation layer(gender, valid name and address before chekin)
      if next_free_room
        next_free_room.checkin(
          user_id: params['user_id']
        )
        update_store
        :success
      else
        ROOM_FULL_MESSAGE
      end
    end

    def checkout(params)
      # Todo add rescue if its get failed to checkout
      marked_to_clear_room = find_room(params['room_id'])
      marked_to_clear_room.vacate
      update_store
    end

    def available_rooms
      rooms.reject(&:occupied)
    end

    def find_room(room_id)
      # Todo Add validation to verify valid room
      rooms
        .select{ |room|
          room.id == room_id.to_i
        }.first
    end

    private

    def next_free_room
      rooms.find do |room|
        return room unless room.occupied
      end
    end

    def update_store
      store = Redis.new(host: 'localhost')
      store.set('hotels', (Marshal.dump self))
    end
  end
end
