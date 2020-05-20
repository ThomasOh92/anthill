class CreateInstructions < ActiveRecord::Migration[5.2]
  def change
    create_table :instructions do |t|
      t.string :caption
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
