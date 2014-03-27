class Session < ActiveRecord::Base
  belongs_to :plan
  belongs_to :answer_flow
  belongs_to :user

end
