class AnswersController < ApplicationController
  def index
    @question = Question.find(params[:question_id])
    @answers = @question.answers.desc
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new

  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question

    if @answer.valid?
      @answer.save
      flash[:notice] = 'Your answer was successfully submitted!'
      redirect_to "/questions/#{@answer.question_id}"
    else
      if @answer.errors.present?
        @answer.errors.full_messages.each do |error|
          flash[:notice] = "#{error}"
        end
      end
      render 'questions/show'
    end
  end
  
  protected
  def answer_params
    params.require(:answer).permit(:answer, :question_id, :user_id)
  end
end
