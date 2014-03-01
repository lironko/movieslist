namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		User.create!(name: "Alexush",
					 email: "something@sashi.com",
					 password: "foobar",
					 password_confirmation: "foobar")
		99.times do |n|
			name = Faker::Name.name
			email = "sashi-#{n+1}@alexush.org"
			password = "password"
			User.create!(name: name,
						 email: email,
						 password: password,
						 password_confirmation: password)
		end
	end
end