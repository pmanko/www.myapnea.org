class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :timeoutable, :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true

  attr_accessor :email_confirmation


  def full_name
    "#{first_name} #{last_name}"
  end
end
