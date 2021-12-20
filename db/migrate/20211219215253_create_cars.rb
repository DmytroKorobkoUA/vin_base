class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :person
      t.string :reg_addr_koatuu
      t.string :oper_code
      t.string :oper_name
      t.string :d_reg
      t.string :dep_code
      t.string :dep
      t.string :brand
      t.string :model
      t.string :vin, null: false
      t.integer :make_year
      t.string :color
      t.string :kind
      t.string :body
      t.string :purpose
      t.string :fuel
      t.integer :capacity
      t.integer :own_weight
      t.integer :total_weight
      t.string :n_reg_new


      t.timestamps
    end
  end
end
