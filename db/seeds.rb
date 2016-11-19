
users = []
10.times do
  users << User.create!(name: Faker::Name.name, password: 'password', email: Faker::Internet.free_email)
end


3.times do
  Pitch.create!(
  body: Faker::Hacker.say_something_smart,
  title: Faker::Pokemon.location,
  student: User.all[4])
end




User.all.each do |user|
  Vote.create!(student: user, pitch: Pitch.all[1])
end

SecretKey.create


#
#
#
#
#
# users << User.create!(name: Faker::Name.full_name, password: 'password', email: Faker::Internet.free_email, admin: true)
