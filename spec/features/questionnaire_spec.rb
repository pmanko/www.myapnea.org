require "spec_helper"

# These Tests use the A Little About Me Questionnaire

# Things to test:
# - Answer creation for all answer types
# - Navigation:
#   - Forward
#   - Backward
#   - Forward and Back
# - Question Help Messages
# - Going Back to a started questionnaire
#   - Restarting
#   - Resuming
#   -

describe "Resuming a questionnaire" do
  before do
    pending "migration to OpenPPRN"
  end

  it "typical workflow" do

    q = QuestionFlow.first
    visit dashboard_path

    click_on q.name

    expect(page).to have_content q.description


  end

end