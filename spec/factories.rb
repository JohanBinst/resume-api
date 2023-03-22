FactoryBot.define do
  factory :resume do
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    email {Faker::Internet.email}
    summary {Faker::Lorem.paragraph}
    job_title {Faker::Job.title}
    phone {Faker::PhoneNumber.phone_number}
    soft_skills {Faker::Lorem.words(number: 4)}
    hard_skills {Faker::Lorem.words(number: 4)}
  end
end


# FactoryBot.define do
#   factory :experience do
#     company_name {Faker::Company.name}
#     job_title {Faker::Job.title}
#     start_date {Faker::Date.between(2.years.ago, Date.today)}
#     end_date {Faker::Date.between(1.years.ago, Date.today)}
#     description {Faker::Lorem.paragraph}
#     resume {FactoryBot.create(:resume)}
#   end
# end

# FactoryBot.define do
#   factory :education do
#     school_name {Faker::Educator.university}
#     degree {Faker::Educator.degree}
#     start_date {Faker::Date.between(2.years.ago, Date.today)}
#     end_date {Faker::Date.between(1.years.ago, Date.today)}
#     description {Faker::Lorem.paragraph}
#     resume {FactoryBot.create(:resume)}
#   end
# end
