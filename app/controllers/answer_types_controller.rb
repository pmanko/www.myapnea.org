class AnswerTypesController < ApplicationController
  def self.model_class
    AnswerType
  end

  # Concerns
  include Scaffoldable

  private

  def object_params
    params.require(:answer_type).permit(:name, :data_type)
  end
end
