class RemoveUserFromQuestions < ActiveRecord::Migration[5.2]
  def change
    remove_column :questions, :user, :string
  end
end
