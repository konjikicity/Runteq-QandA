class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new
    if @answer.update(answer_params)
      redirect_to question_path(@question), success: t('defaults.message.created', item: Answer.model_name.human)
    else
      flash[:danger] = t('defaults.message.not_created', item: Answer.model_name.human)
      render :show
    end
  end
  
  def edit
  end

  private

  def answer_params
    params.require(:answer).permit(:name, :content, :question_id)
  end
end
