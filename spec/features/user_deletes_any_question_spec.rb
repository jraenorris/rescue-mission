require 'rails_helper'

feature 'user deletes a question - sign in or creation does not matter', %Q{
As a user
I want to delete a question
So that I can delete duplicate questions

} do

# Acceptance Criteria
#
# - I must be able delete a question from the question edit page
# - I must be able delete a question from the question details page
# - All answers associated with the question must also be deleted

  let(:question) {FactoryGirl.create(:question)}

  scenario 'user goes to question page and clicks delete to erase it from list' do
    visit edit_question_path(question.id)

    click_button 'Delete Question'

    current_path.should == questions_path
    expect(page).to_not have_content(question.title)

  end
end
