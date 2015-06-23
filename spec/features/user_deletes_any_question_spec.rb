require 'spec_helper'

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

  scenario 'user goes to question page and clicks delete to erase it from list' do
    question = FactoryGirl.create(:question)

    

  end
end
