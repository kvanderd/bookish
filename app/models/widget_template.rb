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

class WidgetTemplate < ActiveRecord::Base
  attr_accessible :classtype, :code, :name
end
