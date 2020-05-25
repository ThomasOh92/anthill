class AddAssignmentToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :assignment, :text
  end
end
