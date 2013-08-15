# == Schema Information
#
# Table name: stories
#
#  id                :integer          not null, primary key
#  title             :string(255)
#  author_first_name :string(255)
#  author_last_name  :string(255)
#  copyright_info    :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  image             :string(255)
#

require 'test_helper'

class StoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
