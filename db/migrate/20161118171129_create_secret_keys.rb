class CreateSecretKeys < ActiveRecord::Migration[5.0]
  def change
    create_table :secret_keys do |t|
      t.string :user_key, default: '2016coyotes'
      t.string :admin_key, default: 'igeekallweek'

      t.timestamps(null: false)
    end
  end
end
