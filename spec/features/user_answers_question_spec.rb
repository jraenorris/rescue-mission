require 'rails_helper'

feature 'user answers a question', %Q{
  As a user
  I want to answer another user's question
  So that I can help them solve their problem

} do
  # Acceptance Criteria
  #
  # - I must be on the question detail page
  # - I must provide a description that is at least 50 characters long
  # - I must be presented with errors if I fill out the form incorrectly
  #

  let!(:question) { Question.create(title: "T" * 40, description: "D" * 151) }


  scenario 'user goes to question detail page and provides a valid answer' do

    answer = "A" * 151
    visit "questions/#{question.id}"

    fill_in 'answer[answer]', with: answer
    click_button "Submit your answer"

    expect(page).to have_content("Your answer was successfully submitted!")
    expect(page).to have_content(answer)
  end

  scenario 'user goes to question detail page and provides an invalid answer' do



    visit "questions/#{question.id}"

    click_button "Submit your answer"

    expect(page).to have_content("Answer is too short (minimum is 50 characters)")

  end
end
