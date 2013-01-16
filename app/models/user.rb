class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :username
  
  validate :email_must_be_unique
  validates :password, :presence => true, :on => :create
  validates :email, :name, :presence => true

  # Validation to ensure emails are unique across both Merchants and Customers.
  def email_must_be_unique
    if ((Organization.where(['email = ?', self.email]).count > 0) or
        (Volunteer.where(['email = ? AND id <> ?', self.email, self.id]).count > 0))

      errors.add(:email, "is already taken")
    end
  end
  
end
