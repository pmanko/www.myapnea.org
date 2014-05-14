require 'spec_helper'

describe QuestionFlow do
  describe "#total_time" do
    it "should calculate total time for example questionnaire" do
      qf = QuestionFlow.find(1)
      expect(qf.total_time.to_f).to eq(10.8)
    end
  end
end