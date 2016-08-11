require 'faker'


 
 # Note: by calling `User.new` instead of `create`,
 # we create an instance of User which isn't immediately saved to the database.
 
 # The `skip_confirmation!` method sets the `confirmed_at` attribute
 # to avoid triggering an confirmation email when the User is saved.
 
 # The `save` method then saves this User to the database.

 # Create an admin user
cat1x = MainCategory.new(title: "first categroy", body: "first category description", template: false) 

cat1x.main_category_pics.build(pic_url:"https://bloccit-120.s3.amazonaws.com/uploads/main_category_pic/pic_url/3/ScreenHunter_04_Jun._08_17.19.gif", name: "", urlseed: "https://bloccit-120.s3.amazonaws.com/uploads/main_category_pic/pic_url/3/ScreenHunter_04_Jun._08_17.19.gif")
cat1x.save!
cat1x1x = cat1x.items.build(title:"the first item title", name: "the first item name", body: "this is the first item body", price: 3.0, active: true )
cat1x1x.save!
Item.find(cat1x1x.id).item_pics.build(pic_url:"https://bloccit-120.s3.amazonaws.com/uploads/item_pic/pic_url/1/ScreenHunter_03_Jun._07_20.03.gif", name: "", urlseed: "https://bloccit-120.s3.amazonaws.com/uploads/item_pic/pic_url/1/ScreenHunter_03_Jun._07_20.03.gif").save!
cat1x2x = cat1x.items.build(title:"second item title", name: "secont item name", body: "second item body", price: 2.0, active: true )
cat1x2x.save!
#=====================================


cat3x = MainCategory.new(title: "this is a template category", body: "this is template body description", template: true) 

cat3x.main_category_pics.build(pic_url:"https://bloccit-120.s3.amazonaws.com/uploads/main_category_pic/pic_url/1/ScreenHunter_03_Jun._07_20.03.gif", name: "template", urlseed: "https://bloccit-120.s3.amazonaws.com/uploads/main_category_pic/pic_url/1/ScreenHunter_03_Jun._07_20.03.gif")
cat3x.main_category_pics.build(pic_url:"https://bloccit-120.s3.amazonaws.com/uploads/main_category_pic/pic_url/2/ScreenHunter_04_Jun._08_17.19.gif", name: "", urlseed: "https://bloccit-120.s3.amazonaws.com/uploads/main_category_pic/pic_url/2/ScreenHunter_04_Jun._08_17.19.gif")
cat3x.save!
cat3x3x = cat3x.items.build(title:"second item title", name: "secont item name", body: "this is second item body", price: 1.0, active: true )
cat3x3x.save!
Item.find(cat3x3x.id).item_pics.build(pic_url:"https://bloccit-120.s3.amazonaws.com/uploads/item_pic/pic_url/2/ScreenHunter_02_Jun._07_20.01.gif", name: "template", urlseed: "https://bloccit-120.s3.amazonaws.com/uploads/item_pic/pic_url/2/ScreenHunter_02_Jun._07_20.01.gif").save!
Item.find(cat3x3x.id).item_pics.build(pic_url:"https://bloccit-120.s3.amazonaws.com/uploads/item_pic/pic_url/3/ScreenHunter_04_Jun._08_17.19.gif", name: "", urlseed: "https://bloccit-120.s3.amazonaws.com/uploads/item_pic/pic_url/3/ScreenHunter_04_Jun._08_17.19.gif").save!
#=====================================


cat4x = MainCategory.new(title: "the second category", body: "the second category body", template: false) 

cat4x.main_category_pics.build(pic_url:"https://bloccit-120.s3.amazonaws.com/uploads/main_category_pic/pic_url/4/ScreenHunter_03_Jun._07_20.03.gif", name: "", urlseed: "https://bloccit-120.s3.amazonaws.com/uploads/main_category_pic/pic_url/4/ScreenHunter_03_Jun._07_20.03.gif")
cat4x.save!
#=====================================


cat48x = MainCategory.new(title: "3rd test", body: "third body", template: true) 

cat48x.main_category_pics.build(pic_url:"https://bloccit-120.s3.amazonaws.com/uploads/main_category_pic/pic_url/40/ScreenHunter_03_Jul._26_19.10.gif", name: "", urlseed: "https://bloccit-120.s3.amazonaws.com/uploads/main_category_pic/pic_url/40/ScreenHunter_03_Jul._26_19.10.gif")
cat48x.save!
#=====================================
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#pic_url: "https://bloccit-120.s3.amazonaws.com/uploads/main_category_pic/pic_url/3/ScreenHunter_04_Jun._08_17.19.gif" ,name: "", description: "https://bloccit-120.s3.amazonaws.com/uploads/main_category_pic/pic_url/3/ScreenHunter_04_Jun._08_17.19.gif"