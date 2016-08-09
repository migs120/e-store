require 'faker'


 
 # Note: by calling `User.new` instead of `create`,
 # we create an instance of User which isn't immediately saved to the database.
 
 # The `skip_confirmation!` method sets the `confirmed_at` attribute
 # to avoid triggering an confirmation email when the User is saved.
 
 # The `save` method then saves this User to the database.

 # Create an admin user
cat1x = MainCategory.new(title: "first categroy", body: "first category description", template: false) 

cat1x.main_category_pics.build(pic_url: "https://bloccit-120.s3.amazonaws.com/uploads/main_category_pic/pic_url/3/ScreenHunter_04_Jun._08_17.19.gif" ,
  name: "", description: "https://bloccit-120.s3.amazonaws.com/uploads/main_category_pic/pic_url/3/ScreenHunter_04_Jun._08_17.19.gif")

cat1x.save!

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#pic_url: "https://bloccit-120.s3.amazonaws.com/uploads/main_category_pic/pic_url/3/ScreenHunter_04_Jun._08_17.19.gif" ,name: "", description: "https://bloccit-120.s3.amazonaws.com/uploads/main_category_pic/pic_url/3/ScreenHunter_04_Jun._08_17.19.gif"