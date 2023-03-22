# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "destroying all resumes ..."
Resume.destroy_all
Education.destroy_all
Experience.destroy_all

johan_resume = Resume.new(
  first_name: "Johan",
  last_name: "Binst",
  email: "johan.binst@gmail.con",
  phone: "+687 72 03 03",
  summary: "I want to become the best developer",
  soft_skills: ["critical thinking", 'problem solving', 'teamwork'],
  hard_skills: ["Ruby on Rails", "Javascript", "Python", "API"],
  job_title: 'Software Engineer'
)

johan_resume.save!

leuven = Education.new({school: "KU Leuven (Belgium)",location: "Leuven", country: "Belgium", remote: false, degree: "Master of Science", major: "Industrial engineering technology: electromechanics", start_date: Date.new(2007, 9, 1), end_date: Date.new(2011, 7, 1)})
leuven.resume = johan_resume
leuven.save!

wagon = Education.new({school: "Le Wagon", location: "Melbourne", country: "Australia", remote: true, degree: "Bootcamp", major: "Web develpment", start_date: Date.new(2023,1,9), end_date: Date.new(2023,3,17)})
wagon.resume = johan_resume
wagon.save!

asco = Experience.new({start_date: Date.new(2012,3,1), end_date: Date.new(2016,4,9), company: "Asco Industries", description: ["make prototypes", "process controll"], job_title: "Process Engineer"})
asco.resume = johan_resume
asco.save!
puts 'seeding done'
