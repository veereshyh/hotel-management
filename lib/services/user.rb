module Services
  class User
    attr_accessor :id, :name, :address, :gender

    def initialize(user_params)
      @name = user_params['name']
      @address = user_params['address']
      @gender = user_params['gender']
      @id = user_params['id']
    end

    def create
      update_store
      self
    end

    private

    def update_store
      store = Redis.new(host: 'localhost')
      store.set('users', (Marshal.dump self))
    end
  end
end
