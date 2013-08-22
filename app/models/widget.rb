# == Schema Information
#
# Table name: widgets
#
#  id         :integer          not null, primary key
#  data       :text
#  name       :string(255)
#  type       :string(255)
#  page_id    :integer
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
  serialize :data, Hash

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

  #this initialization is currently called when a Page is created, which is currently
  #the only place widgets get created.
  def init(page_id, widget_classname)
      self.page_id = page_id
      #set the class of the widget for STI
      self.type = widget_classname.to_s
      self.save

      #in order to call the subclass-specific init_data method, the widget has to be converted to the child widget
      subclasswidget = self.becomes(self.type.constantize)
      subclasswidget.init_data
      #have to save twice. ugly. better way?
      subclasswidget.save
  end

  #each different class of widget initializes the base widget "data" attribute
  #by defining any necessary items.
  def init_data
    raise "someone is trying to use the abstract widget class. bad idea"
  end

  #called in edit and show methods to grab any data that the view needs that isn't already in the data hash
  #an example: an updated list of Pages for a Story view.
  def get_data
    raise "someone is trying to use the abstract widget class. bad idea"
  end

  #a widget's set_data method is called in update methods, to map params to the appropriate parts of the data hash
  def set_data
    raise "someone is trying to use the abstract widget class. bad idea"
  end

  def add_to_page(page_id)
  	@page = Page.find(page_id)
  	@page.widgets << self
  end

  def get_view
    	raise "someone is trying to use the abstract widget class. bad idea"
  end

 


end
