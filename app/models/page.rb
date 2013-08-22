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
  # attr_accessible :title, :body
  belongs_to :story
  has_many :widgets

  serialize :structure, Hash


  def build_structure
  	
  	#placeholder. This will normally be queried
  	structure_definition = {:content_widget1 =>  :ContentWidget, :control_widget1 => :ControlWidget}
  	
  	#the structuremap keeps track of the relationship between the ids of the specific widgets we create here...
  	#and the variables expected by the structure's partial form.
  	structuremap = {}
  	#for each defined widget, create it and link it to this page
  	structure_definition.each do |key, value|  
  		widget = Widget.new
  		widget.page_id = self.id
  		#set the class of the widget for STI
  		widget.type = value.to_s
      widget.save

      #in order to call the subclass-specific initiation, the widget has to be converted to the child widget
      subclasswidget = widget.becomes(value.to_s.constantize)
      subclasswidget.init_data
      #have to save twice. ugly.
      subclasswidget.save

  		structuremap[key] = widget.id
  	end
  	
  	return structuremap


  end
end
 
