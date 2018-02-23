# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Role.create(name: :superadmin)
Role.create(name: :visitor)
user1 = User.create(name:'poonam',address:'commerce six road',
									state:'Gujarat',
									gender:'female',
									city:'Ahmedabad',
									uname: 'poonam',
								    email: 'poonam@gmail.com',
								    password: '123456',
								    password_confirmation: '123456')
user1.add_role(:superadmin)
user2 = User.create(name:'jinal',address:'naranpura',
									state:'Gujarat',
									gender:'female',
									city:'Ahmedabad',
									uname: 'jinal',
								    email: 'jinal@gmail.com',
								    password: '123456',
								    password_confirmation: '123456')
user2.add_role(:visitor)
