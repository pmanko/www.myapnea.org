# Quick tests for model associations

require "spec_helper"

describe "Model Associations" do
  context "Example questionnaire" do
    it "Should load the yaml definitions and have the correct associations" do
      files = [["units.yml", Unit], ["answer_types.yml", AnswerType], ["question_types.yml", QuestionType], ["answer_options.yml", AnswerOption], ["questions.yml", Question], ["question_flows.yml", QuestionFlow], ["question_edges.yml", QuestionEdge]]

      files.each do |file_name, model_class|
        file_path = Rails.root.join('lib', 'data', file_name)

        yaml_data = YAML.load_file(file_path)

        yaml_data.each do |object_attrs|
          MY_LOG.info object_attrs
          model_class.create(object_attrs)
        end

      end

      expect(QuestionFlow.find(1).first_question).to eq(Question.find(1))
      expect(QuestionFlow.find(1).first_question).to eq(Question.find(1))

    end
  end
end
