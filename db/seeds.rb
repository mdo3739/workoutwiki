user = User.new(
	name: 		"Mike Deezy",
	email: 		"admin@example.com",
	password: "helloworld",
	role: 		"admin"
)
user.skip_confirmation!
user.save!

User.create!(
	name: 				"Premium",
	email: 				"moderator@example.com",
	password: 		"helloworld",
	role: 				"premium",
	confirmed_at: Faker::Time.backward(2)
)
User.create!(
	name: 				"Standard",
	email: 				"member@example.com",
	password: 		"helloworld",
	role: 				"standard",
	confirmed_at: Faker::Time.backward(3)
)

4.times do
	User.create!(
		name: 				Faker::Name.name,
		email: 				Faker::Internet.safe_email,
		password: 		Faker::Lorem.characters(10),
		confirmed_at: Faker::Time.backward(14)
	)
end

70.times do
	Wiki.create!(
		title: 		Faker::Company.name,
		summary: 	Faker::Lorem.paragraph,
		user: 		User.all.sample,
		body: 		"1. #{Faker::Lorem.sentence}<br/><br/>2. #{Faker::Lorem.sentence}<br/><br/>3. #{Faker::Lorem.sentence}"
	)
end

puts "Seed Successful"
puts "#{User.all.count} Users"
puts "#{Wiki.all.count} Wikis"