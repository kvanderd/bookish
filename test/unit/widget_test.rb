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

require 'test_helper'

class WidgetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
