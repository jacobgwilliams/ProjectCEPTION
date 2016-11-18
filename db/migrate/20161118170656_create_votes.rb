class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.references :student, null: false
      t.references :pitch, null: false

      t.timestamps(null: false)
    end
  end
end
