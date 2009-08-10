class UserSession
  attr_accessor :login
  attr_accessor :password
  # attr_accessor :controller

  def initialize(options={})
    # @controller = controller
    @login = options[:login]
    @password = options[:password]
  end

  def find
    User.by_login(controller.session[:user_login])
  end

  def save
    user = User.authenticate(:login => @login, :password => @password)
    controller.session[:user_login] = user ? user.login : nil
  end
end
