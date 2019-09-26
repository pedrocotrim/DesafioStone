class CreateEmails < ActiveRecord::Migration[5.2]
  def change
    create_table :emails do |t|
      t.text :body
      t.string :title
      t.integer :priority
      t.string :sender
      t.string :sender_name

      t.timestamps
    end
  end
end
