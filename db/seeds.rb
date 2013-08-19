# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "faker"

id = 1
page_id = 1
widget_id = 1
20.times do
  Story.create(id: id, title: Faker::Company.bs, author_first_name: Faker::Name.first_name, 
               author_last_name: Faker::Name.last_name, copyright_info: Faker::Company.catch_phrase)

  4.times do 
  	Page.create(id: page_id, name: Faker::Name.title, story_id: id )
  	
  	2.times do 
  		Widget.create(id: widget_id, name: Faker::Name.first_name, type: Faker::Company.bs,  html_block_1: Faker::Lorem.characters(char_count = 255) )
        widget_id += 1
  	end
  		page_id += 1
  end
  id += 1
end

WidgetTemplate.create(name: 'Content Widget', classtype: 'ContentWidget')
WidgetTemplate.create(name: 'Control Widget', classtype: 'ControlWidget')


