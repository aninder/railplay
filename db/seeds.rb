# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
begin
  puts "creating users"
  10.times {begin; User.create!(name:FFaker::Name.first_name, email:FFaker::Internet.email, password:"aaa"); rescue ActiveRecord::RecordInvalid;puts"retrying"; retry;end}
  puts "creating roles"
  10.times {begin;Role.create!(name:FFaker::Company.position);rescue ActiveRecord::RecordInvalid;puts"retrying"; retry;end}
  puts "creating org"
  4.times {begin;Org.create!(name:FFaker::Company.name); rescue ActiveRecord::RecordInvalid;puts"retrying"; retry;end}
rescue ActiveRecord::RecordInvalid
  puts "name taken"
end


begin
  puts "creating memberships"
  50.times {begin;Membership.create!(user:User.all.sample, role:Role.all.sample, org:Org.all.sample);rescue ActiveRecord::RecordNotUnique;puts"retrying"; retry;end}
end

