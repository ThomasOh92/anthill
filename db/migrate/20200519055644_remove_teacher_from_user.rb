class RemoveTeacherFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :teacher, :boolean
  end
end
