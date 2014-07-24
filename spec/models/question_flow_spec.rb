require 'spec_helper'

describe QuestionFlow do
  before do
    pending "migration to OpenPPRN"
  end

  describe "#total_time" do
    it "should calculate total time for example questionnaire" do
      pending
      qf = QuestionFlow.find(1)
      expect(qf.total_time.to_f).to eq(10.8)
    end
  end
end