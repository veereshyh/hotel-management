module Services
  class Room
    attr_accessor :id, :occupied, :user_id

    def initialize(id)
      @id = id
      @occupied = false
      @user_id = ''
    end

    def vacate
      @occupied = false
      @user_id = ''
    end

    def available?
      @occupied == false
    end

    def checkin(user_id:)
      @occupied = true
      @user_id = user_id
    end
  end
end
