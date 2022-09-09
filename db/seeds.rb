puts "🌱 Seeding data..."
#Randomizing array examples: ['Area of Dmg', 'Single target Dmg', 'Speed training', 'Burst Dmg', 'Core Attr training'].sample
100.times do
    seeded_customers = Customer.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        gender: Faker::Gender.type,
        email: Faker::Internet.email,
        phone: Faker::PhoneNumber.cell_phone_in_e164,
        address: Faker::Address.street_name,
        town: Faker::Address.city,
        job_type: ['Photovoltaic technology', 'Solar thermal technology'].sample,
        job_description: ['Converts sunlight into electricity.', 'Harnesses its heat'].sample,
        appointment_date: Faker::Time.forward(days: 20, period: :morning),
        solartype_id: rand(1..100),
        technician_id: rand(1..50)
    )
end

50.times do
    seeded_solartypes = Solartype.create(
        type_name: ['Photovoltaic technology', 'Solar thermal technology'].sample,
        type_description: ['Converts sunlight into electricity.', 'Harnesses its heat'].sample,
        type_price: rand(2000..800000)
    )
end

50.times do
    seeded_technicians = Technician.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        phone: Faker::PhoneNumber.cell_phone_in_e164,
        town: Faker::Address.city,
        job_type: ['Photovoltaic technology', 'Solar thermal technology'].sample,
        job_description: ['Converts sunlight into electricity.', 'Harnesses its heat'].sample,
        labour_cost: rand(2000..30000)
    )
end


puts "✅ Done seeding!"
