class CreateTaskComments < ActiveRecord::Migration[5.2]
  def change
    create_table :task_comments do |t|
      t.text :comment
      t.references :task, foreign_key: true
    end
  end
end
