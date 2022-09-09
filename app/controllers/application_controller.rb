class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
      
     %{
                                                                   Welcome to Angaza Jamii Back-end Application!💡

                                                                   
     Endpoints list:
      
                GET requests include:

                              /customers
                              /technicians
                              /solartypes/:id


                              /customers/:id
                              /solartypes/:id
                              /technicians/:id


                POST requests include:
                              /customers
                              /technicians
                              /solartypes/:id

      
                DELETE requests include:
                              /customers/:id
                              /solartypes/:id
                              /technicians/:id


                PATCH requests include:
                              /customers/:id
                                It patches names,address,town,job_type,job_description and appointment_date.

                              /technicians/:id
                              It patches names, town, job_type and job_description.

                              /solartypes/:id
                                It patches the type of solar technology with their description.

                  PUT requests
                             Makes changes all the relevant fields
    }
      
  end

  #Get for all
  get '/customers' do
    all_customers = Customer.all
    all_customers.to_json(only: [:id, :first_name, :last_name, :gender, :email, :phone, :address , :town, :job_type, :job_description, :appointment_date, :solartype_id, :technician_id])
  end

  get '/technicians' do
    all_technicians = Technician.all
    all_technicians.to_json(only: [:id, :first_name, :last_name, :email, :phone, :town, :job_type, :job_description, :labour_cost])
  end

  get '/solartypes' do
    all_solartypes = Solartype.all
    all_solartypes.to_json(only: [:id, :type_name, :type_description, :type_price])
  end

  #Get for one
  get '/customers/:id' do
    single_customer = Customer.find(params[:id])
    single_customer.to_json(only: [:id, :first_name, :last_name, :email, :phone, :address, :town, :appointment_date], include: {
      solartype: { only: [:type_name, :type_price]}
    })
  end

  get '/technicians/:id' do
    single_technician = Technician.find(params[:id])
    single_technician.to_json(only: [:id, :first_name, :last_name, :email, :phone, :town, :labour_cost],
      include: {customers: {only: [:first_name, :last_name, :address, :town, :appointment_date], include: {solartype: {only: [:type_name,:type_price ]}}}}
    )
  end

  get '/solartypes/:id' do
    single_solartype = Solartype.find(params[:id])
    single_solartype.to_json(only: [:id, :type_name, :type_description, :type_price], include: { customers: {only: [:first_name, :last_name]}})
  end

  get '/solartypes/edit/:id' do
    single_solartype = Solartype.find(params[:id])
    single_solartype.to_json(only: [:id, :type_name, :type_description, :type_price], include: {customers: {only: [:first_name, :last_name]}})
  end


  #POST PORTION
  post '/customers' do
    send_it = Customer.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      gender: params[:gender],
      email: params[:email],
      phone: params[:phone],
      address: params[:address],
      town: params[:town],
      job_type: params[:job_type],
      job_description: params[:job_description],
      appointment_date: params[:appointment_date],
      solartype_id: params[:solartype_id],
      technician_id: params[:technician_id]
    )
    send_it.to_json
  end

  post '/solartypes' do
    send_it = Solartype.create(
      type_name: params[:type_name],
      type_description: params[:type_description],
      type_price: params[:type_price]
    )
    send_it.to_json
  end

  post '/technicians' do
    send_it = Technician.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone: params[:phone],
      town: params[:town],
      job_type: params[:job_type],
      job_description: params[:job_description],
      labour_cost: params[:labour_cost]
    )
    send_it.to_json
  end

  #PUT PORTION
  put '/customers/:id' do
    fix_it = Customer.find(params[:id])
    review.update(
      first_name: params[:first_name],
      last_name: params[:last_name],
      gender: params[:gender],
      email: params[:email],
      phone: params[:phone],
      address: params[:address],
      town: params[:town],
      job_type: params[:job_type],
      job_description: params[:job_description],
      appointment_date: params[:appointment_date],
      solartype_id: params[:solartype_id],
      technician_id: params[:technician_id]
    )
    fix_it.to_json
  end

  put '/solartypes/:id' do
    fix_it = Solartype.find(params[:id])
    fix_it.update(
      type_name: params[:type_name],
      type_description: params[:type_description],
      type_price: params[:type_price]
    )
  end

  put '/technicians/:id' do
    fix_it = Technician.find(params[:id])
    fix_it.update(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone: params[:phone],
      town: params[:town],
      job_type: params[:job_type],
      job_description: params[:job_description],
      labour_cost: params[:labour_cost]
    )
    fix_it.to_json
  end

  #PATCH PORTION
  patch '/customers/:id' do
    fix_it = Customer.find(params[:id])
    review.update(
      first_name: params[:first_name],
      last_name: params[:last_name],
      gender: params[:gender],
      email: params[:email],
      phone: params[:phone],
      address: params[:address],
      town: params[:town],
      job_type: params[:job_type],
      job_description: params[:job_description],
      appointment_date: params[:appointment_date],
      solartype_id: params[:solartype_id],
      technician_id: params[:technician_id]
    )
    fix_it.to_json
  end

  patch '/solartypes/:id' do
    fix_it = Solartype.find(params[:id])
    fix_it.update(
      type_name: params[:type_name],
      type_description: params[:type_description],
      type_price: params[:type_price]
    )
  end

  patch '/technicians/:id' do
    fix_it = Technician.find(params[:id])
    fix_it.update(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone: params[:phone],
      town: params[:town],
      job_type: params[:job_type],
      job_description: params[:job_description],
      labour_cost: params[:labour_cost]
    )
    fix_it.to_json
  end

  #DELETE PORTION
  delete '/customers/:id' do
    yeeted = Customer.find(params[:id])
    yeeted.destroy
    yeeted.to_json
  end

  delete '/technicians/:id' do
    yeeted = Technician.find(params[:id])
    yeeted.destroy
    yeeted.to_json
  end

  delete '/solartypes/:id' do
    yeeted = Solartype.find(params[:id])
    yeeted.destroy
    yeeted.to_json
  end

end
