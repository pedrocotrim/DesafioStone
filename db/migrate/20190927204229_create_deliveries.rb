class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.string :status
      t.string :address

      t.timestamps
    end
  end
end
