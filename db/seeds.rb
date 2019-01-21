# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
ToDo.destroy_all

u1 = User.create(first_name: "Paolo", last_name: "Ventura", email: "pv@gmail.com", password: "password")
u2 = User.create(first_name: "Paul", last_name: "Clark", email: "pc@gmail.com", password: "password")


t1 = ToDo.create(header: "first", description: "first")
t2 = ToDo.create(header: "second", description: "second")
