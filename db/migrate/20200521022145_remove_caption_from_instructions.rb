class RemoveCaptionFromInstructions < ActiveRecord::Migration[5.2]
  def change
    remove_column :instructions, :caption, :string
  end
end
