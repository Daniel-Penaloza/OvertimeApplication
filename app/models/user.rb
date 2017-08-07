class User < ApplicationRecord
  has_many :posts
  has_many :audit_logs

  validates_presence_of :first_name, :last_name, :phone

  PHONE_REGEX = /\A\d{10}\Z/
  validates_format_of :phone, with: PHONE_REGEX
  validates :phone, length: { is: 10 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def full_name
  	last_name.upcase + ", " + first_name.upcase
  end
end
