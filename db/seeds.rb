# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Project.destroy_all

Project.create(title: "Project 1", description: "blah blah one blah", completed: true, category: 'potato', tech_stack: 'this will be an array')
Project.create(title: "Project 2", description: "blah blah two blah", completed: false, category: 'potato', tech_stack: 'this will be an array')
Project.create(title: "Project 3", description: "blah blah three blah", completed: true, category: 'potato', tech_stack: 'this will be an array')
Project.create(title: "Project 4", description: "blah blah four blah", completed: true, category: 'potato', tech_stack: 'this will be an array')
Project.create(title: "Project 5", description: "blah blah five blah", completed: false, category: 'potato', tech_stack: 'this will be an array')
