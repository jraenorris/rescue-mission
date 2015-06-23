require 'rails_helper'

feature 'user posts a question - sign in or creation does not matter', %Q{
  As a user
  I want to post a question
  So that I can receive help from others
} do

  # Acceptance Criteria
  #
  # - I must provide a title that is at least 40 characters long
  # - I must provide a description that is at least 150 characters long
  # - I must be presented with errors if I fill out the form incorrectly
  #

  scenario 'user goes to new question page and fills out form correctly' do
    visit '/questions/new'

    question_title = "This is a question that hasn't been asked yet"
    question_description = "This is a super long description that will go on forever and ever and ever and never ever end because its obnoxious and needs to be over 150 characters. Wah."

    fill_in "Title", with: question_title
    fill_in "Description", with: question_description

    click_button "Add Question"

    expect(page).to have_content("Your question has been successfully submitted!")
    expect(page).to have_content(question_title)
    expect(page).to have_content(question_description)
  end

  scenario 'user goes to new question page and fills out form incorrectly' do
    visit '/questions/new'

    click_button "Add Question"

    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Description can't be blank")
  end
end
