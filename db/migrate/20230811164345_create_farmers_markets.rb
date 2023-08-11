class CreateFarmersMarkets < ActiveRecord::Migration[7.0]
  def change
    create_table :farmers_markets do |t|
      t.string :name
      t.string :address
      t.string :site
      t.string :description
      t.string :fnap
      t.string :snap_option
      t.string :accepted_payment
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
