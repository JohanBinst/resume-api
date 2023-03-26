# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "destroying all users and resumes ..."
User.destroy_all
Resume.destroy_all
Education.destroy_all
Experience.destroy_all

johan = User.new(
  email: "johan.binst@gmail.com",
  password: "123456"
)
johan.save!

johan_resume = Resume.new(
                    first_name: "Johan",
                    last_name: "Binst",
                    email: johan.email,
                    phone: "+687 72 03 03",
                    summary: "I want to become the best developer",
                    soft_skills: ["critical thinking", 'problem solving', 'teamwork'],
                    hard_skills: ["Ruby on Rails", "Javascript", "Python", "API"],
                    job_title: 'Software Engineer',
                  )
johan_resume.user = johan
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

tom = User.new(
  email: "tom@gmail.con",
  password: "123456"
)
tom.save!

tom_resume = Resume.new(
                          first_name: "Tom",
                          last_name: Faker::Name.last_name,
                          email: tom.email,
                          phone: Faker::PhoneNumber.phone_number,
                          summary: Faker::Lorem.paragraph(sentence_count: 2),
                          soft_skills: ["critical thinking", 'problem solving', 'teamwork'],
                          hard_skills: ["Ruby on Rails", "Javascript", "Python", "API"],
                          job_title: Faker::Job.title
                        )
tom_resume.user_id = tom.id
tom_resume.save!

tom_education = Education.new({
                                school: Faker::Educator.university,
                                location: Faker::Address.city,
                                country: Faker::Address.country,
                                remote: false, degree: Faker::Educator.degree,
                                major: Faker::Educator.subject,
                                start_date: Date.new(2007, 9, 1),
                                end_date: Date.new(2011, 7, 1)
                              })
tom_education.resume = tom_resume
tom_education.save!

tom_experience = Experience.new({ start_date: Date.new(2012,3,1),
                                  end_date: Date.new(2016,4,9),
                                  company: Faker::Company.name,
                                  description: ["make prototypes", "process controll"],
                                  job_title: Faker::Job.title
                                })
tom_experience.resume = tom_resume
tom_experience.save!

puts 'seeding done'
