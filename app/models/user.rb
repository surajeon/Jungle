class User < ActiveRecord::Base

  has_secure_password

  has_many :reviews

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email, :case_sensitive => false
  validates :password, length: {minimum: 6}
  validates :password_confirmation, :presence => true

  def self.authenticate_with_credentials(email, password)
    user_email = email.strip.downcase
    @user = User.find_by_email(user_email)
    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end

end
