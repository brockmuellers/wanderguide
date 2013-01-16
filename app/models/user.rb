class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :username
  has_secure_password
  
  validate :email_must_be_unique
  validates :password, :presence => true, :on => :create
  validates :email, :first_name, :last_name, :presence => true

  # Validation to ensure emails are unique
  def email_must_be_unique
    if (User.where(['email = ?', self.email]).count > 0)

      errors.add(:email, "is already taken")
    end
  end
  
end
