require 'rails_helper'

feature 'visitor views details of a created question', %Q{
  As a user
I want to view a question's details
So that I can effectively understand the question

} do

  # Acceptance Criteria
  #
  # - I must be able to get to this page from the questions index
  # - I must see the question's title
  # - I must see the question's description

  scenario 'user clicks on question detail link and sees details of the question' do
    question = FactoryGirl.create(:question)

    visit '/questions'
    click_link question.title
    expect(page).to have_content(question.title)
    expect(page).to have_content(question.description)

  end
end
