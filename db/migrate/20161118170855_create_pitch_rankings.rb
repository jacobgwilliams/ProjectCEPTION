class CreatePitchRankings < ActiveRecord::Migration[5.0]
  def change
    create_table :pitch_rankings do |t|
      t.references :student, null: false
      t.references :pitch, null: false
      t.integer :ranking, null: false

      t.timestamps(null: false)
    end
  end
end
