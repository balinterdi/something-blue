class UserSession
  attr_accessor :login
  attr_accessor :password

  def initialize(options)
    @login = options[:login]
    @password = options[:password]
  end

  def valid?
    true
  end

  def save!

  end
end
