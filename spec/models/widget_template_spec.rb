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

require 'spec_helper'

describe WidgetTemplate do
  pending "add some examples to (or delete) #{__FILE__}"
end
