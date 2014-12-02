require 'faker'

desc "add sample users"

task create_sample_db: :environment do

  # User.destroy_all
  # Course.destroy_all
  puts "destroyed old users, courses"

  Course.populate(20) do |course|
    course.name      = Faker::company.name
    course.founded   = Faker::Date.between(15.days.ago, Date.today)
    course.desc      = Faker::Lorem.paragraph
  end
  puts "created #{Course.count} courses"

  # create a login user
  e = User.new
  e.name        = "codebrahma"
  e.email       = "admin@test.com"
  e.password    = "password"
  e.save!
  puts "created admin@test.com : password"

  User.populate(50) do |employer|
    employer.name               = Faker::Name.name
    employer.email              = Faker::Internet.email
    employer.encrypted_password = "password"
    employer.contact_number     = (SecureRandom.random_number * 10000000).round
    employer.sign_in_count      = 1
  end
  puts "created #{User.count} users"

end
