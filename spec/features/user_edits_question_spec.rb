require 'rails_helper'

feature 'visitor edits details of a created question', %Q{
  As a user
  I want to edit a question
  So that I can correct any mistakes or add updates
} do

  # Acceptance Criteria
  #
  # - I must provide valid information
  # - I must be presented with errors if I fill out the form incorrectly
  # - I must be able to get to the edit page from the question details page
  #

  let!(:question) {FactoryGirl.create(:question, title: "T" * 40, description: "D" * 151)}

  scenario 'user clicks on edit question link and updates question validly' do

    valid_title = "This is the new question title. It has been edited. And Saved. Chyea."

    visit "questions/#{question.id}"

    click_button "Edit Question"

    fill_in 'Title', with: valid_title

    click_button "Submit"

    expect(page).to have_content("Your edits were submitted successfully!")
    expect(page).to have_content(valid_title)
    expect(page).to have_content(question.description)

  end

  scenario 'user clicks on edit question link and submits invalid question' do

    invalid_update = Question.create(title: "IA", description: "ID")

    visit "questions/#{question.id}"

    click_button "Edit Question"

    fill_in 'Title', with: invalid_update.title
    fill_in 'Description', with: invalid_update.description

    click_button "Submit"

    invalid_update.errors.full_messages.each do |error|
      expect(page).to have_content(error)
    end
    page.find_field('Title').set(invalid_update.title)
    page.find_field('Title').set(invalid_update.description)
  end
end
