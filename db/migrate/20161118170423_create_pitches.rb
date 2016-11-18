class CreatePitches < ActiveRecord::Migration[5.0]
  def change
    create_table :pitches do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.boolean :advancing, default: false
      t.references :student, null: false

      t.timestamps(null: false)
    end
  end
end
