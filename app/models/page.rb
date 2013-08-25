# == Schema Information
#
# Table name: pages
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  story_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  structure  :text
#


class Page < ActiveRecord::Base
  attr_accessible :id, :name, :story_id
  belongs_to :story
  has_many :widgets

  serialize :structure, Hash


  #the structure of a page is the ordered list of widgets that make up that page. 
  #for V1, we have just a single hardwired structure_definition
  def build_structure
  	
  	#placeholder. This will normally be queried
  	structure_definition = {:content_widget1 =>  :ContentWidget, :control_widget1 => :ControlWidget}
  	
  	#the structuremap keeps track of the relationship between the ids of the specific widgets we create here...
  	#and the variables expected by the structure's partial form.
  	structuremap = {}
  	#for each defined widget, create it and link it to this page
  	structure_definition.each do |key, value|  
  		widget = Widget.new
      widget.init(self.id, value)
  		structuremap[key] = widget.id
  	end
  	
  	return structuremap


  end
end
 
