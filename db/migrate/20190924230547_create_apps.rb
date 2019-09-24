class CreateApps < ActiveRecord::Migration[5.2]
  def change
    create_table :apps do |t|
      t.references :cost_center, foreign_key: true
      t.string :authentication_token
      t.string :name

      t.timestamps
    end
    add_index :apps, :authentication_token, unique: true
  end
end
