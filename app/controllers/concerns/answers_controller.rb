class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      flash[:notice] = 'Your answer has been successfully submitted!'
      redirect_to "/questions/#{@answer.question_id}"
    else
      render :new
    end
  end

  def new
    @answer = Answer.new
  end

  protected
  def answer_params
    params.require(:answer).permit(:answer, :question_id, :user_id)
  end
end
