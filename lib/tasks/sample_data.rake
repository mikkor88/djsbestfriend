namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_users
		make_records
		make_tracks
		make_ownership_relationships
  end
end

def make_users
  admin = User.create!(:name => "Example User",
                       :email => "example@railstutorial.org",
                       :password => "foobar",
                       :password_confirmation => "foobar")
  admin.toggle!(:admin)
	99.times do |n|
		name  = Faker::Name.name
		email = "example-#{n+1}@railstutorial.org"
		password  = "password"
		User.create!(:name => name,
								 :email => email,
								 :password => password,
								 :password_confirmation => password)
	end
end
		def make_records
				50.times do
					title = Faker::Lorem.sentence(1)
					artist = Faker::Lorem.sentence(1)
					genres = ['Jazz', 'Funk', 'Soul', 'Pop/Rock']
					genre = genres[rand(genres.size)]
					types = ["12\"", "7\"", "10\"", "LP", "2xLP", "3xLP", "4xLP",	"Box"]
					type = types[rand(types.size)]
					Record.create!(:title => title, :artist => artist, :genre => genre, :record_type => type)
				end
		end
		
		def make_tracks
			Record.all.each do |record|
				8.times do |index|
					track_title = Faker::Lorem.sentence(1)
					track_number = index + 1
					bpm = [*70..139].sample
					record.tracks.create!(:title => track_title, :track_number => track_number, :bpm => bpm)
				end
			end
		end

		def make_ownership_relationships
			record = Record.all.first
			users = User.all
			owners = users[3..40]
			owners.each { |owner| owner.own!(record) }
		end