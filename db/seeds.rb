# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

skills = ["Singing", "Acting", "Improv", "Clowning", "Balloonist", "Acrobatics", "Magic", "Belly Dancing", "Ballet", "Comedy", "Drag", "Flair Bartending", "Hypnosis", "Guitar", "Drums", "Storytelling", "Ventriloquism", "Charicatures", "Adult Entertainment", "Juggling", "Mime"]

if Skill.count == 0
    skills.sort.each do |skill|
        Skill.create(skills: skill)
        puts "created #{skill}"
    end
end

40.times do |i|
    

    User.create(
        first_name: Faker::Name.first_name, 
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        date_of_birth: Faker::Date.birthday(18, 65),
        contact_number: Faker::PhoneNumber.cell_phone,
        country: Faker::Address.country,
        state: Faker::Address.state,
        city: Faker::Address.city,
        postcode: Faker::Address.postcode,
        suburb: Faker::Address.city,
        password: user.password = "test123",
        password_confirmation: user.password = "test123",
    )
     


    puts "created #{i}"

end

if Mentor.count == 0
    for i in 1..20
        Mentor.create(

        )
    end
end