require 'faker'


 
 # Note: by calling `User.new` instead of `create`,
 # we create an instance of User which isn't immediately saved to the database.
 
 # The `skip_confirmation!` method sets the `confirmed_at` attribute
 # to avoid triggering an confirmation email when the User is saved.
 
 # The `save` method then saves this User to the database.

 # Create an admin user
cat1x = MainCategory.new(title: "first categroy", body: "first category description", template: false) 

cat1x.main_category_pics.build(pic_url:"https://bloccit-120.s3.amazonaws.com/uploads/main_category_pic/pic_url/3/ScreenHunter_04_Jun._08_17.19.gif", name: "", urlseed: "https://bloccit-120.s3.amazonaws.com/uploads/main_category_pic/pic_url/3/ScreenHunter_04_Jun._08_17.19.gif")
cat1x.items.build(title:"the first item title", name: "the first item name", body: "this is the first item body", price: 3.0, active: true )
cat1x.items.build(title:"second item title", name: "secont item name", body: "second item body", price: 2.0, active: true )
cat1x.save!
puts cat1x.inspect




puts cat1x.id
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#pic_url: "https://bloccit-120.s3.amazonaws.com/uploads/main_category_pic/pic_url/3/ScreenHunter_04_Jun._08_17.19.gif" ,name: "", description: "https://bloccit-120.s3.amazonaws.com/uploads/main_category_pic/pic_url/3/ScreenHunter_04_Jun._08_17.19.gif"