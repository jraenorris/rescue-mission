class AnswersController < ApplicationController
  def index
    @question = Question.find(params[:question_id])
    @answers = @question.answers
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new

  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question

    if @answer.save
      flash[:notice] = 'Your answer was successfully submitted!'
      # redirect_to "/questions/#{@answer.question_id}"
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  def show
    @answer = Answer.find(params[:id])
    @question = @answer.question
    @all_answers = Answer.where(question_id: params[:question_id]).collect {|obj| obj.answer}
  end

  protected
  def answer_params
    params.require(:answer).permit(:answer, :question_id, :user_id)
  end
end
