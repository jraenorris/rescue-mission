class QuestionsController < ApplicationController
  def index
    @questions = Question.order(id: :desc)
  end

  def show
    @question = Question.find_by(id: params[:id])
    @answer = Answer.new
    @all_answers = @question.answers
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

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      flash[:success] = 'Your edits were submitted successfully!'
      redirect_to "/questions/#{@question.id}"
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  protected
  def question_params
    params.require(:question).permit(:id, :title, :description)
  end
end
