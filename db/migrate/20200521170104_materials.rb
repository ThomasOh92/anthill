class Materials < ActiveRecord::Migration[5.2]
  def change
    create_table :materials do |t|
      t.string :title
      t.references :project
      t.timestamps
    end
  end
end
