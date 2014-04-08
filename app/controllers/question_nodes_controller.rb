class QuestionNodesController < ApplicationController
  def self.model_class
    QuestionNode
  end

  # Concerns
  include Scaffoldable

  private

  def object_params
    params.require(:question_flow).permit(:answer_option_id, :condition, :child_id)
  end
end
