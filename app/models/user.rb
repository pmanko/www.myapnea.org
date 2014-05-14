class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable #:confirmable,, #:validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  has_many :answer_sessions

  helper_method :view_context
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :zip_code, presence: true
  validates :date_of_birth, presence: true
  validates :email, presence: true, uniqueness: true
  validates :accepted_pledge_at, presence: true, message: "We were unable to sign you up since you did not accept our pledge. Please go to #{view_context.link_to "our pledge page",page_path('pledge')}.".html_safe

  def full_name
    "#{first_name} #{last_name}"
  end
end
