# == Schema Information
#
# Table name: widget_factories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class WidgetTemplate < ActiveRecord::Base
  attr_accessible :name
end
