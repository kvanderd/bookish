# == Schema Information
#
# Table name: widgets
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

#Widgets are chunks of functionality that can be inserted into Layout slots of Pages.
#Widget is a base class. Most likely all real widgets will inherit form it.
#Widgets are created according to the definitions of a Widget Template (Templating Pattern)
#The initial two templates a Content Widget (aka Blob of HTML) and Control Widget (aka 2 Choice Question)

class Widget < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :page

  #allows classes to use the main Instruction controller without errors. STI issue.
  #See "allows children to use their parents routes. " http://www.alexreisner.com/code/single-table-inheritance-in-rails
  def self.inherited(child)
    child.instance_eval do
      def model_name
        Widget.model_name
      end
    end
    super
  end

  #the base class version of update is for selecting the type of a new widget
  def process(params)
    @widget.name = params[:widget][:name]
    @widget.html_block_1 = params[:widget][:html_block_1]
    
  end

  def add_to_page(page_id)
  	@page = Page.find(page_id)
  	@page.widgets << self
  end

  def get_view
    current_class = self.becomes(self.type.constantize)
    if current_class != self 
    	#call the override in the subclass to get the right view
    	current_class.get_view
    else
    	raise "someone is trying to use the abstract widget class"
    end
  end
end
