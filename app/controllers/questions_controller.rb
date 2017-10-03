class QuestionsController < ApplicationController
  before_action :authenticate, only: [:create, :update, :destroy]
  before_action :get_quiz

  def show
    @question = Question.find(params[:id])
  end

  def create
    @question = @quiz.questions.build(question_params)
    @question.user = current_user

    if @question.save
      redirect_to @question
    else
      render 'new'
    end

  end

  def update
    @question = @quiz.questions.find(params[:id])

    if @question.user == current_user
      @question.update!(question_params)
      redirect_to @question
    else
      render 'edit'
    end

  end

  def destroy
    @question = @quiz.questions.find(params[:id])

    if @question.user == current_user
      @question.destroy
      redirect_to @quiz
    else
      render 'show'
    end

  end

  private

  def question_params
    params.require(:question).permit(:body, :weight, :type)
  end

  def get_quiz
    @quiz = Quiz.find(params[:quiz_id])
  end

end
