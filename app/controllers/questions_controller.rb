class QuestionsController < ApplicationController
  before_action :set_question, only: %i[edit show update destroy]
  
  def index
    @questions = Question.all
  end

  def show
    @answer = Answer.new
    @answers = Answer.all.includes(:question)
  end

  def edit;end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to questions_path, success: t('defaults.message.created', item: Question.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_created', item: Question.model_name.human)
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to questions_path, success: t('defaults.message.updated', item: Question.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: Question.model_name.human)
      render :edit
    end
  end

  def destroy
    @question.destroy!
    redirect_to questions_path(@question), success: t('defaults.message.deleted', item: Question.model_name.human)
  end

  private

  def question_params
    params.require(:question).permit(:name, :content)
  end
  
  def set_question
    @question = Question.find(params[:id])
  end
end
