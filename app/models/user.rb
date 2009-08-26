require "digest/sha2"

class User < RelaxDB::Document
  # acts_as_authentic
  attr_accessor :password, :password_confirmation

  property :login, :validator => :required
  property :encrypted_password

  has_many :lent_items, :class => "Lending", :known_as => :from
  has_many :borrowed_items, :class => "Lending", :known_as => :to

  view_by :_id
  view_by :login
  
  before_save :encrypt_password

  def self.authenticate(options)
    user = User.by_login(options[:login])
    if user
      user.encrypted_password == User.encrypt_password(options[:password]) ? user : nil
    end
  end

  def self.encrypt_password(password)
    Digest::SHA512.hexdigest(password)
  end

  def encrypt_password
    self.encrypted_password = self.class.encrypt_password(password)
  end
end
