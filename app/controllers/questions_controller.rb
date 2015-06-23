class QuestionsController < ApplicationController
  def index
    @questions = Question.order(id: :desc)
  end

  def show
    @question = Question.find_by(id: params[:id])
  end
end
