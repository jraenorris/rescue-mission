class QuestionsController < ApplicationController
  def index
    @questions = Question.order(id: :desc)
  end

  def show
    @question = Question.find_by(id: params[:id])
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = 'Your question has been successfully submitted!'
      redirect_to "/questions/#{@question.id}"
    else
      render :new
    end
  end

  protected
  def question_params
    params.require(:question).permit(:id, :title, :description)
  end
end
