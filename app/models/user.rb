class User < ActiveRecord::Base
  include BCrypt

	has_many :questions
	has_many :answers
	has_many :votes
	has_many :comments

  validates :email, :username, uniqueness: true
  validates :password_hash, :email, :username, presence: true 

  def password 
    @password ||= Password.new(password_hash)
  end 

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password 
  end 

  def self.authenticate(email, password)
    @user = User.find_by_email(email)
    if @user.password == password 
      return @user 
    else 
      return nil 
    end 
  end 

end
