class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable #:confirmable,, #:validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  has_many :answer_sessions

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :zip_code, presence: true
  validates :date_of_birth, presence: true
  validates :email, presence: true, uniqueness: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
