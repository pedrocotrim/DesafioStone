class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.references :cost_center, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
