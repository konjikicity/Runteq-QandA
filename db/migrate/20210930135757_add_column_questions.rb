class AddColumnQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :user, :string
  end
end
