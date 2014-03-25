class Session < ActiveRecord::Base
  belongs_to :template
  belongs_to :answer_flow
  belongs_to :user

end
