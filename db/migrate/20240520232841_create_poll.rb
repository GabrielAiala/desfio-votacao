class CreatePoll < ActiveRecord::Migration[7.0]
  def change
    create_table :polls do |t|
      t.references :first_participant, foreign_key: { to_table: :participants }
      t.references :second_participant, foreign_key: { to_table: :participants }
      
      t.timestamps
    end
  end
end
