class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :person, null: false
      t.string :reg_addr_koatuu
      t.string :oper_code
      t.string :oper_name
      t.string :d_reg
      t.string :dep_code
      t.string :dep
      t.string :brand
      t.string :model
      t.string :vin, unique: true, null: false
      t.integer :make_year
      t.string :color
      t.string :kind
      t.string :body
      t.string :purpose
      t.string :fuel
      t.integer :capacity, null: false
      t.integer :own_weight, null: false
      t.integer :total_weight, null: false
      t.string :n_reg_new, null: false


      t.timestamps
    end
  end
end
