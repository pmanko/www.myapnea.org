class AnswerOptionsController < ApplicationController
  def self.model_class
    AnswerOption
  end

  # Concerns
  include Scaffoldable

  private

  def object_params
    params.require(:answer_option).permit(:numeric_value, :text_value, :time_value)
  end
end
