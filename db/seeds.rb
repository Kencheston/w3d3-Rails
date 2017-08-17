# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do

  user1 = User.create!(email: 'CJ')
  user2 = User.create!(email: 'Flarnie')
  user3 = User.create!(email: 'Jeff')
  user4 = User.create!(email: 'Georges St. Pierre')
  user5 = User.create!(email: 'Ned')


  short1 = ShortenedUrl.create_for_user_and_long_url!(user1, 'www.hotmail.com')
  short2 = ShortenedUrl.create_for_user_and_long_url!(user2, 'www.aol/email/john_smith.com')
  short3 = ShortenedUrl.create_for_user_and_long_url!(user3, 'www.myspace.com')
  short4 = ShortenedUrl.create_for_user_and_long_url!(user4, 'www.aim.com')
  short5 = ShortenedUrl.create_for_user_and_long_url!(user5, 'www.yahoo.com')

  Visit.record_visit!(user1, short1)
  Visit.record_visit!(user2, short2)
  Visit.record_visit!(user3, short3)
  Visit.record_visit!(user4, short4)
  Visit.record_visit!(user5, short5)

end
