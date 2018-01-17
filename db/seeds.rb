# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

 User.create!(name: 'Nelson Dornelas',
             email: 'ndornelasj@gmail.com',
             password: 'foobar',
             password_confirmation: 'foobar',
             admin: true)

user = User.first
user.posts.create!(title: 'New Post Title',
                   content: 'Post content'
)

valid_team_rosters = %w[Under-7 Under-8 Under-9 Under-10 Adults]
valid_team_rosters.each { |roster|
  Team.create!(roster_name: roster)
}