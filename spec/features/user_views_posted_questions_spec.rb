require 'rails_helper'

feature 'visitor views created questions', %Q{
  As a user
  I want to view recently posted questions
  So that I can help others

} do

  # Acceptance Criteria
  #
  # - I must see the title of each question
  # - I must see questions listed in order, most recently posted first
  #
  #
  # let(:question) { FactoryGirl.create{:question} }
  # let(:secondquestion) { FactoryGirl.create{:secondquestion} }

  scenario 'user sees the title for each question in order' do
    question = FactoryGirl.create(:question)
    secondquestion = FactoryGirl.create(:question, title: "This is the second index which we should see first as it is the most recent", description: "1234567891011121314151617181920212223242526272829303132333435363738393404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899100")

    visit '/questions'

    expect(secondquestion.title).to appear_before(question.title)
  end
end
