class CreateSolartypes < ActiveRecord::Migration[6.1]
  def change
    #create solartypes table
    create_table :solartypes do |t|
      t.string :type_name
      t.string :type_description
      t.integer :type_price
      t.timestamps
    end
  end
end
