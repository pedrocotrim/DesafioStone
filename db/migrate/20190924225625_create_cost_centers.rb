class CreateCostCenters < ActiveRecord::Migration[5.2]
  def change
    create_table :cost_centers do |t|
      t.string :name

      t.timestamps
    end
  end
end
