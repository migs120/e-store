require 'faker'

cat1x = MainCategory.new(title: "first categroy", body: "first category description", template: false) 

cat1x.main_category_pics.build(pic_url:"https://bloccit-120.s3.amazonaws.com/uploads/main_category_pic/pic_url/1/ScreenHunter_05_Sep._17_11.13.gif", name: "pic name", urlseed: "https://bloccit-120.s3.amazonaws.com/uploads/main_category_pic/pic_url/1/ScreenHunter_05_Sep._17_11.13.gif")
cat1x.save!
cat1x1x = cat1x.items.build(title:"the first item title", name: "the first item name", body: "this is the first item body", price: 3.0, active: true )
cat1x1x.save!
Item.find(cat1x1x.id).item_pics.build(pic_url:"https://bloccit-120.s3.amazonaws.com/uploads/item_pic/pic_url/1/Stone_Bricks_Wall_Wooden_Floor_Desktop_Wallpaper.jpg", name: "", urlseed: "https://bloccit-120.s3.amazonaws.com/uploads/item_pic/pic_url/1/Stone_Bricks_Wall_Wooden_Floor_Desktop_Wallpaper.jpg").save!
cat1x2x = cat1x.items.build(title:"second item title", name: "secont item name", body: "second item body", price: 2.0, active: true )
cat1x2x.save!
#=====================================


cat2x = MainCategory.new(title: "this is a template category", body: "this is template body description", template: true) 

cat2x.main_category_pics.build(pic_url:"https://bloccit-120.s3.amazonaws.com/uploads/main_category_pic/pic_url/2/YWEAcvK.jpg", name: "template", urlseed: "https://bloccit-120.s3.amazonaws.com/uploads/main_category_pic/pic_url/2/YWEAcvK.jpg")
cat2x.main_category_pics.build(pic_url:"https://bloccit-120.s3.amazonaws.com/uploads/main_category_pic/pic_url/3/Stone_Bricks_Wall_Wooden_Floor_Desktop_Wallpaper.jpg", name: "", urlseed: "https://bloccit-120.s3.amazonaws.com/uploads/main_category_pic/pic_url/3/Stone_Bricks_Wall_Wooden_Floor_Desktop_Wallpaper.jpg")
cat2x.save!
cat2x3x = cat2x.items.build(title:"second item title", name: "secont item name", body: "this is second item body", price: 1.0, active: true )
cat2x3x.save!
Item.find(cat2x3x.id).item_pics.build(pic_url:"", name: "template", urlseed: "https://bloccit-120.s3.amazonaws.com/uploads/item_pic/pic_url/2/ScreenHunter_02_Jun._07_20.01.gif").save!
Item.find(cat2x3x.id).item_pics.build(pic_url:"", name: "", urlseed: "https://bloccit-120.s3.amazonaws.com/uploads/item_pic/pic_url/3/ScreenHunter_04_Jun._08_17.19.gif").save!
#=====================================


cat3x = MainCategory.new(title: "the second category", body: "the second category body", template: false) 

cat3x.main_category_pics.build(pic_url:"https://bloccit-120.s3.amazonaws.com/uploads/main_category_pic/pic_url/4/ScreenHunter_04_Sep._17_11.12.gif", name: "", urlseed: "https://bloccit-120.s3.amazonaws.com/uploads/main_category_pic/pic_url/4/ScreenHunter_04_Sep._17_11.12.gif")
cat3x.save!
#=====================================


cat4x = MainCategory.new(title: "3rd test", body: "third body", template: true) 

cat4x.main_category_pics.build(pic_url:"https://bloccit-120.s3.amazonaws.com/uploads/main_category_pic/pic_url/5/ScreenHunter_03_Jun._07_20.03.gif", name: "", urlseed: "https://bloccit-120.s3.amazonaws.com/uploads/main_category_pic/pic_url/5/ScreenHunter_03_Jun._07_20.03.gif")
cat4x.save!
#=====================================
 
 # Note: by calling `User.new` instead of `create`,
 # we create an instance of User which isn't immediately saved to the database.
 
 # The `skip_confirmation!` method sets the `confirmed_at` attribute
 # to avoid triggering an confirmation email when the User is saved.
 
 # The `save` method then saves this User to the database.

 # Create an admin user
 admin = User.new(
   name:     'AdminUser',
   email:    'admin@example.com',
   password: '11223344',
   role:     'admin'
 )
 admin.skip_confirmation!
 admin.save!
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#pic_url: "https://bloccit-120.s3.amazonaws.com/uploads/main_category_pic/pic_url/3/ScreenHunter_04_Jun._08_17.19.gif" ,name: "", description: "https://bloccit-120.s3.amazonaws.com/uploads/main_category_pic/pic_url/3/ScreenHunter_04_Jun._08_17.19.gif"