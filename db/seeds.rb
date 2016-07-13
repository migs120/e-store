 require 'faker'

 # Create Users
# 5.times do
 #  user = User.new(
  #   name:     Faker::Name.name,
   #  email:    Faker::Internet.email,
    # password: "11223344",
    # role: "member"
   #)
   #user.skip_confirmation!
   #user.save!
 #end
 #users = User.all
 Product.delete_all
Product.create! id: 1, name: "Banana", price: 0.49, active: true
Product.create! id: 2, name: "Apple", price: 0.29, active: true
Product.create! id: 3, name: "Carton of Strawberries", price: 1.99, active: true

OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"
 # Note: by calling `User.new` instead of `create`,
 # we create an instance of User which isn't immediately saved to the database.
 
 # The `skip_confirmation!` method sets the `confirmed_at` attribute
 # to avoid triggering an confirmation email when the User is saved.
 
 # The `save` method then saves this User to the database.
 
 # Create Posts
 # Create an admin user
if 1==0 
 admin = User.new(
   name:     'AdminUser',
   email:    'admin@example.com',
   password: '11223344',
   role:     'admin'
 )
 admin.skip_confirmation!
 admin.save!
 
 # Create a moderator
 moderator = User.new(
   name:     'ModeratorUser',
   email:    'moderator@example.com', 
   password: '11223344',
   role:     'member'
 )
 moderator.skip_confirmation!
 moderator.save!
 
 # Create a member
 member = User.new(
   name:     'MemberUser',
   email:    'migs910@hotmail.com',
   password: '11223344',
   role: "member"
 )
 member.skip_confirmation!
 member.save!
  
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
