class CreateTechnicians < ActiveRecord::Migration[6.1]
  def change
    #create technicians table
    create_table :technicians do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :town
      t.string :job_type
      t.string :job_description
      t.integer :labour_cost
      t.timestamps
    end

  end
end
