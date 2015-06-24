require 'rails_helper'

RSpec.describe Answer, type: :model do
  before :each do
    @question_id = 3
    Question.create(id: @question_id, title: "T" * 40, description: "D" * 151)
    @answer1 = Answer.create(answer: "A" * 50, question_id: @question_id)
    @answer2 = Answer.create(answer: "a" * 50, question_id: 4)
  end

  describe "dependant destroy" do
    it "will delete answers for that question but not others" do
      Question.where(id: @question_id).destroy_all
      @answer1.should_not exist_in_database
      @answer2.should exist_in_database
    end
  end


end
