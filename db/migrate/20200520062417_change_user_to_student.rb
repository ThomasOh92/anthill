class ChangeUserToStudent < ActiveRecord::Migration[5.2]
  def change
    #Drop the users table, drop projects_users
    drop_table :users
    drop_table :projects_users
    # add projects_students
    create_table :projects_students do |t|
      t.references :project
      t.references :student
      t.timestamps
    end
  end
end
