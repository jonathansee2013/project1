# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
u1 = User.create username: "Abraham1", email: "abe1@gmail.com", password: "chicken"
u2 = User.create username: "Benjamin2", email: "ben2@ymail.com", password: "chicken"
u3 = User.create username: "Charles3", email: "chacha3@gmail.com", password: "chicken"

puts "Created #{ User.all.length } users."

Property.destroy_all
p1 = Property.create address: "1 Astrid Street", suburb: "Allawah", state: "NSW", postcode: "2218", description: "One room furnished with bed and closet."
p2 = Property.create address: "2 Bastion Place", suburb: "Brody", state: "NSW", postcode: "2220", description: "One room unfurnished."
p3 = Property.create address: "3 Charisma Crescent", suburb: "Carlton", state: "NSW", postcode: "2221", description: "Apartment with two bedrooms and one toilet and bath."

puts "Created #{ Property.all.length } properties."

Review.destroy_all
r1 = Review.create comment: "The room was spacious. I love it!", rating: 4
r2 = Review.create comment: "Tiny room. Hate it", rating: 1
r3 = Review.create comment: "The place is well-lit. I enjoy living here", rating: 5
r4 = Review.create comment: "Large spacious room!", rating: 5
r5 = Review.create comment: "Place is too small", rating: 5

puts "Created #{ Review.all.length } reviews."

Image.destroy_all
i1 = Image.create url: "http://4.bp.blogspot.com/-RSAdi3NMMs8/VakWj_znRcI/AAAAAAAAAMI/lp19iktRyCw/s1600/Rent%2Broom%2Bstockholm.jpg"
i2 = Image.create url: "http://www.ikea.com/gb/en/images/rooms/ikea-clean-green-and-clutter-free-__1364315962817-s4.jpg"
i3 = Image.create url: "http://www.coolumatthebeach.com.au/images/accommodation/two-bedroom-apartment-kitchen-sunshine-coast.jpg"
i4 = Image.create url: "https://secure.img1-fg.wfcdn.com/lf/85/hash/2664/36573018/1/custom_image.jpg"

puts "Created #{ Image.all.length } images."

u1.properties << p1
u2.properties << p2
u3.properties << p3

puts "User #{ u1.username } has #{ u1.properties.length } properties."

p1.reviews << r1 << r4
p2.reviews << r2 << r5
p3.reviews << r3

puts "Property located in #{ p1.address } #{ p1.suburb } #{ p1.state } has #{ p1.reviews.length } reviews."

u1.reviews << r1 << r4
u2.reviews << r2 << r5
u3.reviews << r3

puts "User #{ u1.username } has #{ u1.reviews.length } reviews."

p1.images << i1 << i4
p2.images << i2
p3.images << i3

puts "Property located in #{ p1.address } #{ p1.suburb } #{ p1. state } has #{ p1.reviews.length } reviews."
