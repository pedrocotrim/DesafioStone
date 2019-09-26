class CreateSentMails < ActiveRecord::Migration[5.2]
  def change
    create_table :sent_mails do |t|
      t.references :email, foreign_key: true
      t.string :recipient
      t.boolean :opened

      t.timestamps
    end
  end
end
