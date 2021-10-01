class QuestionsController < ApplicationController
  before_action :set_question, only: %i[edit show update destroy]
  
  def index
    @questions = Question.all
  end

  def show;end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to root_path, success: t('defaults.message.created', item: Question.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.deleted', item: Question.model_name.human)
      render :new
    end
  end

  def edit;end

  private

  def question_params
    params.require(:question).permit(:name, :content)
  end
  
  def set_question
    @question = Question.find(params[:id])
  end
end
