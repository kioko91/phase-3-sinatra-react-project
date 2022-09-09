class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    #create customers table
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :email
      t.string :phone
      t.string :address
      t.string :town
      t.string :job_type
      t.string :job_description
      t.datetime :appointment_date
      t.integer :solartype_id
      t.integer :technician_id
      t.timestamps
    end

  end
end
