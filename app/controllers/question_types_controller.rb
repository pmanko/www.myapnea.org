class QuestionTypesController < ApplicationController
  def self.model_class
    QuestionType
  end

  # Concerns
  include Scaffoldable

  private
  def object_params
    params.require(:question_type).permit(:name)
  end
end
