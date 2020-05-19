class AddTeacherToProjects < ActiveRecord::Migration[5.2]
  def change
    add_reference :projects, :teacher, foreign_key: true`
  end
end
