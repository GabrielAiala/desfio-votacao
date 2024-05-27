class AddPictureToParticipant < ActiveRecord::Migration[7.0]
  def change
    add_column :participants, :picture, :text, null: true
  end
end
