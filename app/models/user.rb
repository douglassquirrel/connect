class User < ActiveRecord::Base
  validates_presence_of :username, :password, :name 
  validates_uniqueness_of :username, :name 

  has_many :tasks

  def password
    @password
  end

  def password=(password)
    @password=password
    self.hashed_password = User.encrypt(@password)
  end

  def self.encrypt(password)
    Digest::SHA1.hexdigest(password)
  end

  def self.authenticate(username, password)
    u = find(:first, :conditions=>["username = ?", username])
    return nil if u.nil?
    return u if User.encrypt(password) == u.hashed_password
    nil
  end  

end
