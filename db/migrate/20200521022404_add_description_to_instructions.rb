class AddDescriptionToInstructions < ActiveRecord::Migration[5.2]
  def change
    add_column :instructions, :description, :text
  end
end
