class CreateInstructions < ActiveRecord::Migration[5.2]
  def change
    create_table :instructions do |t|
      t.text :body
      t.references :project, foreign_key: true
    end
  end
end
