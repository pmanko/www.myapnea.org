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

  it "typical workflow" do
    pending

    q = QuestionFlow.first
    visit dashboard_path

    click_on q.name

    expect(page).to have_content q.description


  end

  it "should present question after last answer" do

  end

end