class AnswersController < ApplicationController
  before_action :current_user, only: [:create, :update, :destroy]
  before_action :get_question

  def create
    @answer = @question.answers.build(answer_params)
    @answer.user = @current_user

    if @answer.save
      redirect_to @question
    else
      render 'new'
    end

  end

  def update
    @answer = @question.answers.find(params[:id])

    if @answer.user == @current_user
      @answer.update!(answer_params)
      redirect_to @question
    else
      render 'edit'
    end

  end

  def destroy
    @answer = @question.answers.find(params[:id])

    if @answer.user == @current_user
      @answer.destroy
      redirect_to @question
    else
      render 'index'
    end

  end

  private

  def answer_params
    params.require(:question).permit(:body, :correct?, :image_url)
  end

  def get_question
    @question = Question.find(params[:question_id])
  end

end
