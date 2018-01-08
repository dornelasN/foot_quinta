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

users = User.order(:created_at).take(1)
10.times do
  title = "This is New post"
  content = "Let's write some stuff here so that we have a big enough content"
  users.each { |user| user.posts.create!(title: title, content: content) }
end
