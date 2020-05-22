class ChangeTaskCommentsToTaskcomments < ActiveRecord::Migration[5.2]
  def change
    rename_table :task_comments, :taskcomments
  end
end
