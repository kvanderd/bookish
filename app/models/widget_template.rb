# == Schema Information
#
# Table name: widget_templates
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  classtype  :string(255)
#  code       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


#Template Pattern implementation for the creation of lots of different kinds of widgets.
#http://reefpoints.dockyard.com/ruby/2013/07/10/design-patterns-template-pattern.html

class WidgetTemplate < ActiveRecord::Base
  attr_accessible :classtype, :code, :name
end
