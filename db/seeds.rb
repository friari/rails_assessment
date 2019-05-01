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
