class User < ApplicationRecord
  has_many :posts
  
  validates_presence_of :first_name, :last_name
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def full_name
  	last_name.upcase + ", " + first_name.upcase
  end
end
