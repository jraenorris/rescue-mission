require 'rails_helper'

feature "user views answer for a single question", %Q{

As a user
I want to view the answers for a question
So that I can learn from the answer

} do

  #   Acceptance Criteria
  #
  #   - I must be on the question detail page
  #   - I must only see answers to the question I'm viewing
  #   - I must see all answers listed in order, most recent last
  #

  scenario 'user sees answers in order for a question on its show page' do
    question = FactoryGirl.create(:question, id: 5)
    answer = FactoryGirl.create(:answer, answer: "This is the first answer." * 10)
    second_answer = FactoryGirl.create(:answer, answer: "This is the second answer." * 10)

    visit "questions/#{question.id}"

    fill_in 'answer[answer]', with: answer.answer
    click_button 'Submit your answer'

    fill_in 'answer[answer]', with: second_answer.answer
    click_button 'Submit your answer'

    expect(answer.answer).to appear_before(second_answer.answer)
  end
end
