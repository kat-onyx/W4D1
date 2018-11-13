# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

users = []
10.times do
  users << User.create(username: Faker::Artist.name)
end

artworks = []
users.each do |user|
  artworks << Artwork.create(title: Faker::ChuckNorris.fact, image_url: Faker::GameOfThrones.city, artist_id: user.id)
end

artworkshares = []
artworks.each do |artwork|
  user_id = nil
  until user_id
    user_id = User.all.sample.id unless user_id == artwork.artist_id
  end
  artworkshares << ArtworkShare.create(artwork_id: artwork.id, viewer_id: user_id)
end
