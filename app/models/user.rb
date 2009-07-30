class User < RelaxDB::Document
  # acts_as_authentic

  property :login, :validator => :required
  property :password
  property :password_confirmation

  view_by :login
end
