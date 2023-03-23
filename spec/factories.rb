FactoryBot.define do
  factory :resume do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    summary { Faker::Lorem.paragraph }
    job_title { Faker::Job.title }
    phone { Faker::PhoneNumber.phone_number }
    soft_skills { Faker::Lorem.words(number: 4) }
    hard_skills { Faker::Lorem.words(number: 4) }
  end
end


FactoryBot.define do
  factory :experience do
    company { Faker::Company.name }
    job_title { Faker::Job.title }
    start_date { Faker::Date.between(from: 3.years.ago, to: 2.years.ago).strftime('%Y-%m-%d') }
    end_date { Faker::Date.between(from: 1.years.ago, to: Date.today).strftime('%Y-%m-%d') }
    description { Faker::Lorem.paragraph }
  end
end

FactoryBot.define do
  factory :education do
    school { Faker::Educator.university }
    degree { Faker::Educator.degree }
    major { Faker::Educator.subject }
    location { Faker::Address.city }
    remote { Faker::Boolean.boolean }
    start_date { Faker::Date.between(from: 3.years.ago, to: 2.years.ago).strftime('%Y-%m-%d') }
    end_date { Faker::Date.between(from: 1.years.ago, to: Date.today).strftime('%Y-%m-%d') }
  end
end
