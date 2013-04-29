class Account < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #  and :omniauthable, :encryptable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable,
         :confirmable, :lockable, :timeoutable

  # Setup accessible (or protected) attributes for your model
  #attr_accessible :email, :password, :password_confirmation, :remember_me

  belongs_to :person
  has_many :teachers
end
