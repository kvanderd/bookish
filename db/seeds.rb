# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "faker"

id = 1
20.times do
  Story.create(id: id, title: Faker::Company.bs, author_first_name: Faker::Name.first_name , author_last_name: Faker::Name.last_name)
  id += 1
end

WidgetTemplate.create(name: 'Content Widget', classtype: 'ContentWidget')
WidgetTemplate.create(name: 'Control Widget', classtype: 'ControlWidget')


