class QuizzesController < ApplicationController
  before_action :authenticate, only: [:create, :update, :destroy]

  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  def create
    @Quiz = Question.create(quiz_params)
    @quiz.user = current_user
    if @quiz.save
      render 'show'
    else
      render json: {
        errors: @quiz.errors
      }, status: :bad_request
    end
  end

  def update
    @quiz = Quiz.find(params[:id])
    if @quiz.user == current_user
      @quiz.update!(quiz_params)
      render :show
    else
      render json: {error: "You are not authorized to update this question"}, status: :unauthorized
    end
  end

  def destroy
    @quiz = Quiz.find(params[:id])
    if @quiz.user == current_user
      @quiz.destroy
      render json: {deleted: true}
    else
      render json: {error: "You are not authorized to delete this question"}, status: :unauthorized
    end
  end

  private

  def quiz_params
    params.require(:quiz).permit(:title, :total_points, :type, :published)
  end

end
