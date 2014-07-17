class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable #:confirmable,, #:validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :answer_sessions
  has_many :answers
  has_many :votes

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :zip_code, presence: true
  validates :year_of_birth, presence: true
  validates :email, presence: true, uniqueness: true
  validates_presence_of :accepted_pledge_at, message: lambda{|e,f| "We were unable to sign you up since you did not accept our promise. Please read and accept <a href=\"#{Rails.application.routes.url_helpers.pledge_path}\">our promise</a> before continuing. ".html_safe}

  def full_name
    "#{first_name} #{last_name}"
  end
end
