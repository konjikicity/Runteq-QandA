class AnswersController < ApplicationController
  before_action :set_answers, only: %i[edit update destroy]

  def create    
    @question = Question.find(params[:question_id])
    @answer = current_user.answers.build(answer_params)
    if @answer.save!
      redirect_to question_path(@question), success: t('defaults.message.created', item: Answer.model_name.human)
    else
      redirect_to question_path(@question), danger: t('defaults.message.not_created', item: Answer.model_name.human)
      
    end
  end
  
  def edit;end

  def update
    if @answer.update(answer_params)
      redirect_to question_path(@question), success: t('defaults.message.updated', item: Answer.model_name.human)
    else
      flash[:danger] = t('defaults.message.not_updated', item: Answer.model_name.human)
      render :edit
    end
  end

  def destroy
    @answer.destroy!
    redirect_to question_path(@question), success: t('defaults.message.deleted', item: Answer.model_name.human)
  end

  private

  def answer_params
    params.require(:answer).permit(:name, :content, :question_id)
  end

  def set_answers
    @answer = Answer.find(params[:id])
    @question = Question.find(params[:question_id])
  end 

end
