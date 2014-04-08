class QuestionFlowsController < ApplicationController
  def self.model_class
    QuestionFlow
  end

  # Concerns
  include Scaffoldable

  private

  def object_params
    params.require(:plan).permit(:name, :question_flow_id)
  end
end
